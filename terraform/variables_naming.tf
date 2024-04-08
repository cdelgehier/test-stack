# Variables for "naming" module
variable "app_code" {
  type    = string
  default = "APP00000"
}

variable "app_env" {
  type = string
}

variable "app_name" {
  type = string
}


variable "archiving" {
  type    = string
  default = "no"
}

variable "aws_env" {
  type = string
}

variable "aws_id" {
  type = string
}


variable "backup" {
  type    = string
  default = "no"
}

variable "data_classification" {
  type    = string
  default = "C1"
}


variable "app_project" {
  type = string
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags to be added to the resources."
}

# variable "owner" {
#   type    = string
#   default = "__NONE__@__NONE__"
# }
