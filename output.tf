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
  value       = try(aws_db_instance.this.address, "")
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = try(aws_db_instance.this.arn, "")
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = try(aws_db_instance.this.availability_zone, "")
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = try(aws_db_instance.this.endpoint, "")
}

output "db_instance_engine" {
  description = "The database engine"
  value       = try(aws_db_instance.this.engine, "")
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = try(aws_db_instance.this.hosted_zone_id, "")
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = try(aws_db_instance.this.id, "")
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = try(aws_db_instance.this.resource_id, "")
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = try(aws_db_instance.this.status, "")
}

output "db_instance_name" {
  description = "The database name"
  value       = try(aws_db_instance.this.db_name, "")
}

output "db_instance_username" {
  value       = try(aws_db_instance.this.username, "")
  sensitive   = true
  description = "The master username for the database"
}

output "db_instance_port" {
  value = try(aws_db_instance.this.port, "")
}

output "db_instance_ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  value       = try(aws_db_instance.this.ca_cert_identifier, "")
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = try(aws_db_instance.this.domain, "")
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service. "
  value       = try(aws_db_instance.this.domain_iam_role_name, "")
}

output "db_instance_password" {
  description = "The master password"
  value       = try(aws_db_instance.this.password, "")
  sensitive   = true
}


output "db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = aws_cloudwatch_log_group.this
}

output "db_parameter_group_id" {
  description = "The db parameter group id"
  value       = try(aws_db_parameter_group.this.id, "")
}

output "db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = try(aws_db_parameter_group.this.arn, "")
}

output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = try(aws_db_subnet_group.this.id, "")
}

output "db_subnet_group_name" {
  description = "The db subnet group name"
  value       = try(aws_db_subnet_group.this.name, "")
}
