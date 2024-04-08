#! PROVIDER SPECIFICS
variable "aws_account_id" {
  type        = string
  description = "The aws account id to deploy the module."
}

variable "aws_region" {
  type        = string
  description = "The aws region of the provider."
}

#! EC2 Variables
variable "instance_name" {
  type        = string
  description = "The name of the instance."
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
}

# variable "create_security_group" {
#   type        = bool
#   description = "Create a custom secgroup ?"
# }

variable "security_group_ingress_rules" {
  type    = map(map(string))
  default = {}
}


variable "security_group_egress_rules" {
  type    = map(map(string))
  default = {}

}

variable "kms_key_id" {
  description = "The KMS key ID to encrypt EBS"
  type        = string
}

variable "key_pair" {
  description = "The name of the key pair to associate with the EC2 instance"
  type        = string
}

variable "root_block_device_size" {
  description = "The size of the main volume for the root filesystem"
  type        = number
  default     = 30
}

variable "root_block_device_type" {
  description = "The type of storage volume for the root filesystem"
  type        = string
  default     = "gp3"
}

variable "iam_instance_profile" {
  description = "Name of the IAM instance profile to associate with the EC2 instance"
  type        = string
}

variable "ebs_block_device_map" {
  description = "List of additional disks"
  type        = map(map(string))
  default     = {}
}

variable "enable_termination_protection" {
  description = "Enable termination protection on the instance"
  type        = bool
  default     = false
}

variable "enable_shutdown_protection" {
  description = "Enable shutdown protection on the instance"
  type        = bool
  default     = false
}
