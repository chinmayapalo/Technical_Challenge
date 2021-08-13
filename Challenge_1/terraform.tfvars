# Project wide variable
PROJECT_NAME = "demo"

# Varibles for the Providers
AWS_ACCESS_KEY = ""
AWS_SECRET_KEY = ""
AWS_REGION     = "ap-south-1"

# AWS_AMI_VARIABLE
AWS_AMI_FILTER_NAME      = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"
AWS_AMI_VR_TYPE          = "hvm"
AWS_AMI_ROOT_DEVICE_TYPE = "ebs"
AWS_AMI_ARCHITECTURE     = "x86_64"

# VPC Variables
VPC_CIDR_BLOCK                 = "10.0.0.0/16"
VPC_PUBLIC_SUBNET1_CIDR_BLOCK  = "10.0.1.0/24"
VPC_PUBLIC_SUBNET2_CIDR_BLOCK  = "10.0.2.0/24"
VPC_PRIVATE_SUBNET1_CIDR_BLOCK = "10.0.3.0/24"
VPC_PRIVATE_SUBNET2_CIDR_BLOCK = "10.0.4.0/24"
VPC_BASTION_SUBNET_CIDR_BLOCK  = "10.0.254.0/24"

# ALB variables

# EXTERNAL / WEBSERVER ALB
EXT_ALB_LIS_PORT     = "80"
EXT_ALB_LIS_PROTOCOL = "HTTP"
EXT_ALB_ROUTE_TYPE   = "forward"
EXT_ALB_TG_PORT      = "80"
EXT_ALB_TG_PROTOCOL  = "HTTP"

# INTERNAL / APPSERVER ALB
INT_ALB_LIS_PORT     = "80"
INT_ALB_LIS_PROTOCOL = "HTTP"
INT_ALB_ROUTE_TYPE   = "forward"
INT_ALB_TG_PORT      = "80"
INT_ALB_TG_PROTOCOL  = "HTTP"


# Ec2 /Autoscaling Variables

#Bastion host
BASTION_HOST_INSTANCE_TYPE         = "t2.micro"
BASTION_HOST_ROOTBLOCK_VOLUME_TYPE = "gp2"
BASTION_HOST_ROOTBLOCK_VOLUME_SIZE = "30"
SSH_CIDR_BASTION_HOST              = "0.0.0.0/0"
PEM_FILE_BASTION_HOST              = "ansible-controller-keypair"

#WEBSERVER
WEB_SERVER_INSTANCE_TYPE         = "t2.micro"
WEB_SERVER_ROOTBLOCK_VOLUME_TYPE = "gp2"
WEB_SERVER_ROOTBLOCK_VOLUME_SIZE = "30"
PEM_FILE_WEBSERVERS              = "ansible-controller-keypair"
USER_DATA_FOR_WEBSERVER          = "./files/web.sh"
SSH_CIDR_WEB_SERVER              = "0.0.0.0/0"
ASG_WEBSERVER_HC_TYPE            = "EC2"
ASG_WEBSERVER_HC_GRACE_PERIOD    = "30"
ASG_WEBSERVER_DC                 = "2"
ASG_WEBSERVER_MAXSIZE            = "5"
ASG_WEBSERVER_MINSIZE            = "2"

#APPSERVER
APP_SERVER_INSTANCE_TYPE         = "t2.micro"
APP_SERVER_ROOTBLOCK_VOLUME_TYPE = "gp2"
APP_SERVER_ROOTBLOCK_VOLUME_SIZE = "30"
PEM_FILE_APPSERVERS              = "ansible-controller-keypair"
USER_DATA_FOR_APPSERVER          = "./files/app.sh"
SSH_CIDR_APP_SERVER              = "0.0.0.0/0"
ASG_APPSERVER_HC_TYPE            = "EC2"
ASG_APPSERVER_HC_GRACE_PERIOD    = "30"
ASG_APPSERVER_DC                 = "2"
ASG_APPSERVER_MAXSIZE            = "5"
ASG_APPSERVER_MINSIZE            = "2"


# RDS variable
RDS_ENGINE              = "mysql"
ENGINE_VERSION          = "5.7.17"
RDS_USERNAME            = "test"
RDS_PASSWORD            = "test123#$"
DB_INSTANCE_CLASS       = "db.t2.micro"
RDS_STORAGE_TYPE        = "gp2"
RDS_ALLOCATED_STORAGE   = "20"
BACKUP_RETENTION_PERIOD = "7"
RDS_CIDR                = "0.0.0.0/0"
