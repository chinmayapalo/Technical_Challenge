# Project wide variable
variable "PROJECT_NAME" {}

# Varibles for the Providers
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}

# AWS_AMI_VARIABLE
variable "AWS_AMI_FILTER_NAME" {}
variable "AWS_AMI_VR_TYPE" {}
variable "AWS_AMI_ROOT_DEVICE_TYPE" {}
variable "AWS_AMI_ARCHITECTURE" {}


# VPC Variables
variable "VPC_CIDR_BLOCK" {}
variable "VPC_PUBLIC_SUBNET1_CIDR_BLOCK" {}
variable "VPC_PUBLIC_SUBNET2_CIDR_BLOCK" {}
variable "VPC_PRIVATE_SUBNET1_CIDR_BLOCK" {}
variable "VPC_PRIVATE_SUBNET2_CIDR_BLOCK" {}
variable "VPC_BASTION_SUBNET_CIDR_BLOCK" {}

# ALB variables

# EXTERNAL / WEBSERVER ALB
variable "EXT_ALB_LIS_PORT" {}
variable "EXT_ALB_LIS_PROTOCOL" {}
variable "EXT_ALB_ROUTE_TYPE" {}
variable "EXT_ALB_TG_PORT" {}
variable "EXT_ALB_TG_PROTOCOL" {}

# INTERNAL / APPSERVER ALB
variable "INT_ALB_LIS_PORT" {}
variable "INT_ALB_LIS_PROTOCOL" {}
variable "INT_ALB_ROUTE_TYPE" {}
variable "INT_ALB_TG_PORT" {}
variable "INT_ALB_TG_PROTOCOL" {}


# Ec2 /Autoscaling Variables

#Bastion host
variable "BASTION_HOST_INSTANCE_TYPE" {}
variable "BASTION_HOST_ROOTBLOCK_VOLUME_TYPE" {}
variable "BASTION_HOST_ROOTBLOCK_VOLUME_SIZE" {}
variable "SSH_CIDR_BASTION_HOST" {}
variable "PEM_FILE_BASTION_HOST" {}

#WEBSERVER
variable "WEB_SERVER_INSTANCE_TYPE" {}
variable "WEB_SERVER_ROOTBLOCK_VOLUME_TYPE" {}
variable "WEB_SERVER_ROOTBLOCK_VOLUME_SIZE" {}
variable "PEM_FILE_WEBSERVERS" {}
variable "USER_DATA_FOR_WEBSERVER" {}
variable "SSH_CIDR_WEB_SERVER" {}
variable "ASG_WEBSERVER_HC_TYPE" {}
variable "ASG_WEBSERVER_HC_GRACE_PERIOD" {}
variable "ASG_WEBSERVER_DC" {}
variable "ASG_WEBSERVER_MAXSIZE" {}
variable "ASG_WEBSERVER_MINSIZE" {}

#APPSERVER
variable "APP_SERVER_INSTANCE_TYPE" {}
variable "APP_SERVER_ROOTBLOCK_VOLUME_TYPE" {}
variable "APP_SERVER_ROOTBLOCK_VOLUME_SIZE" {}
variable "PEM_FILE_APPSERVERS" {}
variable "USER_DATA_FOR_APPSERVER" {}
variable "SSH_CIDR_APP_SERVER" {}
variable "ASG_APPSERVER_HC_TYPE" {}
variable "ASG_APPSERVER_HC_GRACE_PERIOD" {}
variable "ASG_APPSERVER_DC" {}
variable "ASG_APPSERVER_MAXSIZE" {}
variable "ASG_APPSERVER_MINSIZE" {}


# RDS variables
variable "RDS_ENGINE" {}
variable "ENGINE_VERSION" {}
variable "RDS_USERNAME" {}
variable "RDS_PASSWORD" {}
variable "DB_INSTANCE_CLASS" {}
variable "RDS_STORAGE_TYPE" {}
variable "RDS_ALLOCATED_STORAGE" {}
variable "BACKUP_RETENTION_PERIOD" {}
variable "RDS_CIDR" {}
