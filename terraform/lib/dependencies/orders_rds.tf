module "orders_rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.5.0"

  identifier = "${var.environment_name}-orders"

  engine            = "postgres"
  engine_version    = "15.4"
  instance_class    = "db.t3.medium"
  allocated_storage = 20

  subnet_ids = var.subnet_ids

  vpc_security_group_ids = concat(var.allowed_security_group_ids, [var.orders_security_group_id])

  db_name  = "orders"
  username = "dbadmin"
  password = random_string.orders_db_master.result

  storage_encrypted   = true
  apply_immediately   = true
  skip_final_snapshot = true

  backup_retention_period = var.rds_backup_retention_period

  create_db_parameter_group = true
  parameter_group_name      = "${var.environment_name}-orders"
  family                    = "postgres15"

  tags = var.tags
}

resource "random_string" "orders_db_master" {
  length  = 16
  special = false
}