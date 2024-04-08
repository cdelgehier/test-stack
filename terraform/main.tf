terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "aws" {
  alias  = "bootstrap"
  region = "eu-west-1"
}

data "aws_secretsmanager_secret" "external_id" {
  provider = aws.bootstrap
  arn      = "arn:aws:secretsmanager:eu-west-1:333230080375:secret:cycloid/infra/external_id-KkOKGt"
}

data "aws_secretsmanager_secret_version" "external_id" {
  provider  = aws.bootstrap
  secret_id = data.aws_secretsmanager_secret.external_id.id
}

provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn    = "arn:aws:iam::${var.aws_account_id}:role/cycloid-infrabuilder" ## This role is always the same for all account
    external_id = local.external_id
  }
  default_tags {
    # tags = module.naming.default_tags
  }
}

locals {
  deployment_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFmoOVnNi5KeXaqXF8ZwBvgAReyR6ODXb6meAINg9a81"

  user_data = <<-EOT
  #! /bin/bash
  apt update && apt upgrade -y
  apt install iptables -y
  echo "${local.deployment_public_key}" > /root/.ssh/authorized_keys
  EOT

  external_id     = jsondecode(data.aws_secretsmanager_secret_version.external_id.secret_string)["external_id"]
  next_month_date = formatdate("DD-MM-YYYY", timeadd(timestamp(), "720h")) # 720h = 30 days

  ebs_block_device = [
    for device_name, attributes in var.ebs_block_device_map : {
      device_name           = device_name
      volume_size           = attributes["volume_size"]
      volume_type           = attributes["volume_type"]
      kms_key_id            = var.kms_key_id
      encrypted             = true
      delete_on_termination = true
    }
  ]
}




data "aws_subnet" "selected" {
  id = var.subnet_id
}

module "instance" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v5.5.0"

  name                   = var.instance_name
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id

  key_name                = var.key_pair
  iam_instance_profile    = var.iam_instance_profile
  disable_api_termination = var.enable_termination_protection
  disable_api_stop        = var.enable_shutdown_protection

  root_block_device = [
    {
      kms_key_id  = var.kms_key_id
      encrypted   = true
      volume_size = var.root_block_device_size
      volume_type = var.root_block_device_type
    }
  ]

  ebs_block_device = local.ebs_block_device

  metadata_options = {
    http_endpoint               = "enabled",
    http_put_response_hop_limit = 1,
    http_tokens                 = "required"
  }

  # tags        = merge(module.naming.aws_ec2_instance_tags, { "Name" = var.instance_name })
  #volume_tags = module.naming.aws_ebs_volume_tags


}
