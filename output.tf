output "enhanced_monitoring_iam_role_name" {
  description = "The name of the monitoring role"
  value       = try(aws_iam_role.enhanced_monitoring[0].name, "")
}

output "enhanced_monitoring_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the monitoring role"
  value       = try(aws_iam_role.enhanced_monitoring[0].arn, "")
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = try(aws_db_instance.this[0].address, "")
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = try(aws_db_instance.this[0].arn, "")
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = try(aws_db_instance.this[0].availability_zone, "")
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = try(aws_db_instance.this[0].endpoint, "")
}

output "db_instance_engine" {
  description = "The database engine"
  value       = try(aws_db_instance.this[0].engine, "")
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = try(aws_db_instance.this[0].hosted_zone_id, "")
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = try(aws_db_instance.this[0].id, "")
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = try(aws_db_instance.this[0].resource_id, "")
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = try(aws_db_instance.this[0].status, "")
}

output "db_instance_name" {
  description = "The database name"
  value       = try(aws_db_instance.this[0].db_name, "")
}

output "db_instance_username" {
  value       = try(aws_db_instance.this[0].username, "")
  sensitive   = true
  description = "The master username for the database"
}

output "db_instance_port" {
  value = try(aws_db_instance.this[0].port, "")
}

output "db_instance_ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  value       = try(aws_db_instance.this[0].ca_cert_identifier, "")
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = try(aws_db_instance.this[0].domain, "")
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service. "
  value       = try(aws_db_instance.this[0].domain_iam_role_name, "")
}

output "db_instance_password" {
  description = "The master password"
  value       = try(aws_db_instance.this[0].password, "")
  sensitive   = true
}


output "db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = aws_cloudwatch_log_group.this
}

output "db_parameter_group_id" {
  description = "The db parameter group id"
  value       = try(aws_db_parameter_group.this[0].id, "")
}

output "db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = try(aws_db_parameter_group.this[0].arn, "")
}

output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = try(aws_db_subnet_group.this[0].id, "")
}

output "db_subnet_group_name" {
  description = "The db subnet group name"
  value       = try(aws_db_subnet_group.this[0].name, "")
}

output "kms_key_arn" {
  description = "ARN of the created KMS key."
  value       = aws_kms_key.default[0].arn
}

output "kms_key_id" {
  description = "ID of the created KMS key."
  value       = aws_kms_key.default[0].id
}

output "kms_key_policy" {
  description = "Policy associated with the KMS key."
  value       = aws_kms_key.default[0].policy
}

output "kms_key_rotation_enabled" {
  description = "Indicates whether key rotation is enabled."
  value       = aws_kms_key.default[0].enable_key_rotation
}

output "kms_key_multi_region" {
  description = "Indicates whether the key is a multi-Region key."
  value       = aws_kms_key.default[0].multi_region
}

output "ssm_parameter_name" {
  value       = aws_ssm_parameter.secret-endpoint[0].name
  description = "The name of the SSM parameter created."
}

output "ssm_parameter_arn" {
  value       = aws_ssm_parameter.secret-endpoint[0].arn
  description = "The ARN of the SSM parameter created."
}

output "ssm_parameter_value" {
  value       = aws_ssm_parameter.secret-endpoint[0].value
  description = "The value of the SSM parameter created."
  sensitive   = true # Mark as sensitive to avoid exposing secrets in outputs
}
