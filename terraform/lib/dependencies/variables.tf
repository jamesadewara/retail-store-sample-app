variable "environment_name" {
  type        = string
  description = "Name of the environment"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the resources"
}

variable "subnet_ids" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
}

variable "tags" {
  description = "List of tags to be associated with resources."
  default     = {}
  type        = any
}

variable "catalog_security_group_id" {
  type        = string
  description = "Security group ID of the catalog component"
}

variable "orders_security_group_id" {
  type        = string
  description = "Security group ID of the orders component"
}

variable "checkout_security_group_id" {
  type        = string
  description = "Security group ID of the checkout component"
}

variable "allowed_security_group_ids" {
  type        = list(string)
  default     = []
  description = "List of additional allowed security group IDs"
}

variable "catalog_opensearch_instance_type" {
  type        = string
  description = "Instance type for OpenSearch domain of the catalog component"
  default     = "t3.small.search" # "r8g.medium.search" --- IGNORE ---
}

variable "aws_mq_broker_host_instance_type" {
  type        = string
  description = "Host instance type for AWS MQ broker"
  default     = "mq.m5.large" # "mq.m5.large" --- IGNORE ---
}

variable "rds_backup_retention_period" {
  type        = number
  description = "Number of days to retain backups for RDS instances"
  default     = 1 # Set to 1 day for cost optimization; adjust as needed --- IGNORE ---
}

variable "catalog_rds_instance_class"{
  type        = string
  description = "Instance class for the catalog RDS database"
  default     = "db.t3.micro" # "db.t3.medium" --- IGNORE ---
}

variable "orders_rds_instance_class"{
  type        = string
  description = "Instance class for the orders RDS database"
  default     = "db.t3.micro" # "db.t3.medium" --- IGNORE ---
}