<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Overview

This Terraform module facilitates the deployment of an AWS infrastructure environment for Cycloid, utilizing various AWS services and configurations. The module automates the provisioning of resources required for a Cycloid application, including an EC2 instance, naming conventions, and associated AWS components.

## Examples

```hcl

```

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement_aws) | 5.29.0 |
| <a name="requirement_random"></a> [random](#requirement_random) | 3.5.1 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | 5.29.0 |
| <a name="provider_aws.bootstrap"></a> [aws.bootstrap](#provider_aws.bootstrap) | 5.29.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_instance"></a> [instance](#module_instance) | git::https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git | v5.5.0 |

### Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.external_id](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.external_id](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/data-sources/secretsmanager_secret_version) | data source |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/5.29.0/docs/data-sources/subnet) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input_ami) | ID of AMI to use for the instance | `string` | n/a | yes |
| <a name="input_app_code"></a> [app_code](#input_app_code) | Variables for "naming" module | `string` | `"APP00000"` | no |
| <a name="input_app_env"></a> [app_env](#input_app_env) | n/a | `string` | n/a | yes |
| <a name="input_app_name"></a> [app_name](#input_app_name) | n/a | `string` | n/a | yes |
| <a name="input_app_project"></a> [app_project](#input_app_project) | n/a | `string` | n/a | yes |
| <a name="input_archiving"></a> [archiving](#input_archiving) | n/a | `string` | `"no"` | no |
| <a name="input_aws_account_id"></a> [aws_account_id](#input_aws_account_id) | The aws account id to deploy the module. | `string` | n/a | yes |
| <a name="input_aws_env"></a> [aws_env](#input_aws_env) | n/a | `string` | n/a | yes |
| <a name="input_aws_id"></a> [aws_id](#input_aws_id) | n/a | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | The aws region of the provider. | `string` | n/a | yes |
| <a name="input_backup"></a> [backup](#input_backup) | n/a | `string` | `"no"` | no |
| <a name="input_data_classification"></a> [data_classification](#input_data_classification) | n/a | `string` | `"C1"` | no |
| <a name="input_ebs_block_device_map"></a> [ebs_block_device_map](#input_ebs_block_device_map) | List of additional disks | `map(map(string))` | `{}` | no |
| <a name="input_enable_shutdown_protection"></a> [enable_shutdown_protection](#input_enable_shutdown_protection) | Enable shutdown protection on the instance | `bool` | `false` | no |
| <a name="input_enable_termination_protection"></a> [enable_termination_protection](#input_enable_termination_protection) | Enable termination protection on the instance | `bool` | `false` | no |
| <a name="input_extra_tags"></a> [extra_tags](#input_extra_tags) | Extra tags to be added to the resources. | `map(string)` | `{}` | no |
| <a name="input_iam_instance_profile"></a> [iam_instance_profile](#input_iam_instance_profile) | Name of the IAM instance profile to associate with the EC2 instance | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance_name](#input_instance_name) | The name of the instance. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type) | The type of instance to start | `string` | n/a | yes |
| <a name="input_key_pair"></a> [key_pair](#input_key_pair) | The name of the key pair to associate with the EC2 instance | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms_key_id](#input_kms_key_id) | The KMS key ID to encrypt EBS | `string` | n/a | yes |
| <a name="input_root_block_device_size"></a> [root_block_device_size](#input_root_block_device_size) | The size of the main volume for the root filesystem | `number` | `30` | no |
| <a name="input_root_block_device_type"></a> [root_block_device_type](#input_root_block_device_type) | The type of storage volume for the root filesystem | `string` | `"gp3"` | no |
| <a name="input_security_group_egress_rules"></a> [security_group_egress_rules](#input_security_group_egress_rules) | n/a | `map(map(string))` | `{}` | no |
| <a name="input_security_group_ingress_rules"></a> [security_group_ingress_rules](#input_security_group_ingress_rules) | n/a | `map(map(string))` | `{}` | no |
| <a name="input_subnet_id"></a> [subnet_id](#input_subnet_id) | The VPC Subnet ID to launch in | `string` | n/a | yes |
| <a name="input_vpc_security_group_ids"></a> [vpc_security_group_ids](#input_vpc_security_group_ids) | A list of security group IDs to associate with | `list(string)` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output_arn) | The ARN of the instance |
| <a name="output_id"></a> [id](#output_id) | The ID of the instance |
| <a name="output_private_dns"></a> [private_dns](#output_private_dns) | The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC |

## Contributing

We welcome contributions! If you encounter issues or have suggestions for improvements, please open an issue or submit a pull request on our GitLab repository.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
