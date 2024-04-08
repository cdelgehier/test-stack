output "id" {
  description = "The ID of the instance"
  value = try(
    module.instance.aws_instance.this[0].id,
    module.instance.aws_instance.ignore_ami[0].id,
    module.instance.aws_spot_instance_request.this[0].id,
    null,
  )
}

output "arn" {
  description = "The ARN of the instance"
  value = try(
    module.instance.aws_instance.this[0].arn,
    module.instance.aws_instance.ignore_ami[0].arn,
    module.instance.aws_spot_instance_request.this[0].arn,
    null,
  )
}


output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value = try(
    module.instance.aws_instance.this[0].private_dns,
    module.instance.aws_instance.ignore_ami[0].private_dns,
    module.instance.aws_spot_instance_request.this[0].private_dns,
    null,
  )
}
