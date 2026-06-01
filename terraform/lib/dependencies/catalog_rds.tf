module "catalog_rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.5.0"

  identifier = "${var.environment_name}-catalog"

  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = "db.t3.medium"
  allow_major_version_upgrade = true
  
  allocated_storage           = 20

  subnet_ids                  = var.subnet_ids 

  vpc_security_group_ids      = concat(var.allowed_security_group_ids, [var.catalog_security_group_id])

  db_name                = "catalog"
  username               = "dbadmin"
  password               = random_string.catalog_db_master.result

  storage_encrypted   = true
  apply_immediately    = true
  skip_final_snapshot  = true
  
  backup_retention_period = var.rds_backup_retention_period

  create_db_parameter_group = true
  parameter_group_name      = "${var.environment_name}-catalog" 
  family                    = "mysql8.0"                   

  tags = var.tags
}

resource "random_string" "catalog_db_master" {
  length  = 16 
  special = false
}