# RDS Database Instance configuration

resource "aws_db_instance" "db" {
  engine                  = var.RDS_ENGINE
  engine_version          = var.ENGINE_VERSION
  identifier              = "${var.PROJECT_NAME}-rds"
  username                = var.RDS_USERNAME
  password                = var.RDS_PASSWORD
  instance_class          = var.DB_INSTANCE_CLASS
  storage_type            = var.RDS_STORAGE_TYPE
  allocated_storage       = var.RDS_ALLOCATED_STORAGE
  multi_az                = true
  vpc_security_group_ids  = [aws_security_group.rds-sgp.id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  backup_retention_period = var.BACKUP_RETENTION_PERIOD
}

# DB subnet group details
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "${var.PROJECT_NAME}_db_subnet_group"
  description = "Allowed subnets for  DB cluster instances"
  subnet_ids  = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  tags = {
    Name = "${var.PROJECT_NAME}-rds-Subnet-Group"
  }
}

# Output -- Returning  DB endpoint
output "rds_db_endpoint" {
  value = aws_db_instance.db.endpoint
}
