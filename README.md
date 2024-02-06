# Terraform-aws-db

# Terraform AWS Cloud DB Module

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#Examples)
- [Author](#Author)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This Terraform module creates an AWS Database Service- AWS (DB) along with additional configuration options.
## Usage
To use this module, you can include it in your Terraform configuration. Here's an example of how to use it:

## Examples

## Example: MariaDB

```hcl
module "mariadb" {
  source                          = "cypik/mariadb/aws"
  version                         = "1.0.1"
  name                            = "mariadb"
  environment                     = "test"
  label_order                     = ["environment", "name"]
  engine                          = "MariaDB"
  engine_version                  = "10.6.10"
  instance_class                  = "db.m5.large"
  engine_name                     = "MariaDB"
  allocated_storage               = 50
  db_name                         = "test"
  username                        = "user"
  password                        = "esfsgcGdfawAhdxtfjm!"
  port                            = "3306"
  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  multi_az                        = false
  vpc_id                          = module.vpc.id
  allowed_ip                      = [module.vpc.vpc_cidr_block]
  allowed_ports                   = [3306]
  family                          = "mariadb10.6"
  backup_retention_period         = 0
  enabled_cloudwatch_logs_exports = ["audit", "general"]
  subnet_ids                      = module.private_subnets.public_subnet_id
  publicly_accessible             = true
  major_engine_version            = "10.6"
  deletion_protection             = true
  ssm_parameter_endpoint_enabled  = true
}
```
## Example: mysql-complete
```hcl
module "mysql" {
  source                          = "cypik/mysql/aws"
  version                         =  "1.0.1"
  name                            = "mysql"
  environment                     = "test"
  label_order                     = ["environment", "name"]
  engine                          = "mysql"
  engine_version                  = "8.0.28"
  instance_class                  = "db.m6i.xlarge."
  allocated_storage               = 5
  vpc_id                          = module.vpc.id
  allowed_ip                      = [module.vpc.vpc_cidr_block]
  allowed_ports                   = [3306]
  db_name                         = "test"
  username                        = "user"
  password                        = "esfsgcGdfawAhdxtfjm!"
  port                            = "3306"
  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  multi_az                        = false
  backup_retention_period         = 7
  enabled_cloudwatch_logs_exports = ["audit", "general"]
  subnet_ids                      = module.subnets.public_subnet_id
  publicly_accessible             = true
  family                          = "mysql8.0"
  major_engine_version            = "8.0"
  deletion_protection             = true

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8"
    },
    {
      name  = "character_set_server"
      value = "utf8"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
  ssm_parameter_endpoint_enabled = true
}
```
## Example: oracle_db
```hcl
module "oracle" {
  source                              = "cypik/oracle/aws"
  version                             = "1.0.1"
  name                                = "oracle"
  environment                         = "test"
  label_order                         = ["environment", "name"]
  engine                              = "oracle-ee"
  engine_version                      = "19"
  instance_class                      = "db.t3.medium"
  engine_name                         = "oracle-ee"
  allocated_storage                   = 50
  storage_encrypted                   = true
  family                              = "oracle-ee-19"
  db_name                             = "test"
  username                            = "admin"
  password                            = "esfsgcGdfawAhdxtfjm!"
  port                                = "1521"
  maintenance_window                  = "Mon:00:00-Mon:03:00"
  backup_window                       = "03:00-06:00"
  multi_az                            = false
  vpc_id                              = module.vpc.id
  allowed_ip                          = [module.vpc.vpc_cidr_block]
  allowed_ports                       = [1521]
  backup_retention_period             = 0
  enabled_cloudwatch_logs_exports     = ["audit"]
  subnet_ids                          = module.private_subnets.public_subnet_id
  publicly_accessible                 = true
  major_engine_version                = "19"
  deletion_protection                 = true
  iam_database_authentication_enabled = false
  ssm_parameter_endpoint_enabled      = true
}
```
## Example: postgreSQL
```hcl
module "postgresql" {
  source                          = "cypik/postgresql/aws"
  version                         = "1.0.1"
  name                            = "postgresql"
  environment                     = "test"
  label_order                     = ["environment", "name"]
  engine                          = "postgres"
  engine_version                  = "14.6"
  instance_class                  = "db.t3.medium"
  allocated_storage               = 50
  engine_name                     = "postgres"
  storage_encrypted               = true
  family                          = "postgres14"
  db_name                         = "test"
  username                        = "dbname"
  password                        = "esfsgcGdfawAhdxtfjm!"
  port                            = "5432"
  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  multi_az                        = false
  vpc_id                          = module.vpc.id
  allowed_ip                      = [module.vpc.vpc_cidr_block]
  allowed_ports                   = [5432]
  backup_retention_period         = 0
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  subnet_ids                      = module.private_subnets.public_subnet_id
  publicly_accessible             = true
  major_engine_version            = "14"
  deletion_protection             = true
  ssm_parameter_endpoint_enabled  = true
}
```
## Example: replica-mysql
```hcl
module "mysql" {
  source                          = "cypik/mysql/aws"
  version                         = "1.0.1"
  name                            = "rds"
  environment                     = "test"
  label_order                     = ["environment", "name"]
  enabled                         = true
  engine                          = "mysql"
  engine_version                  = "8.0"
  instance_class                  = "db.t4g.large"
  replica_instance_class          = "db.t4g.large"
  allocated_storage               = 20
  identifier                      = ""
  snapshot_identifier             = ""
  kms_key_id                      = ""
  enabled_read_replica            = true
  enabled_replica                 = true
  db_name                         = "replica"
  username                        = "replica_mysql"
  password                        = "clkjvnsdikjhdsijfsdli"
  port                            = 3306
  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  multi_az                        = true
  vpc_id                          = module.vpc.id
  allowed_ip                      = [module.vpc.vpc_cidr_block]
  allowed_ports                   = [3306]
  backup_retention_period         = 1
  enabled_cloudwatch_logs_exports = ["general"]
  subnet_ids                      = module.subnets.public_subnet_id
  publicly_accessible             = false
  family                          = "mysql8.0"
  major_engine_version            = "8.0"
  auto_minor_version_upgrade      = false
  deletion_protection             = true
  ssm_parameter_endpoint_enabled  = true
}
```

## Example
For detailed examples on how to use this module, please refer to the '[example](https://github.com/cypik/terraform-aws-db/tree/master/example)' directory within this repository.

## Author
Your Name Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/cypik/terraform-aws-db/blob/master/LICENSE) file for details.