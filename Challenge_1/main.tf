# Define the provider
provider "aws" {
  access_key = var.AWS_ACCESS_KEY # AWS Access key
  secret_key = var.AWS_SECRET_KEY # AWS Secret Access Key
  region     = var.AWS_REGION     # The region in which you want to Operate
  #profile    = "default"
}

# Datasource for AMI

data "aws_ami" "ubuntu" {
  most_recent = "true"
  owners      = ["aws-marketplace"]
  filter {
    name   = "name"
    values = [var.AWS_AMI_FILTER_NAME]
  }
  filter {
    name   = "virtualization-type"
    values = [var.AWS_AMI_VR_TYPE]
  }
  filter {
    name   = "root-device-type"
    values = [var.AWS_AMI_ROOT_DEVICE_TYPE]
  }
  filter {
    name   = "architecture"
    values = [var.AWS_AMI_ARCHITECTURE]
  }
}

output "aws_ami" {
  value = data.aws_ami.ubuntu.id
}

# Bastion host

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.BASTION_HOST_INSTANCE_TYPE
  key_name      = var.PEM_FILE_BASTION_HOST
  subnet_id     = aws_subnet.bastion_subnet.id
  root_block_device {
    volume_type = var.BASTION_HOST_ROOTBLOCK_VOLUME_TYPE
    volume_size = var.BASTION_HOST_ROOTBLOCK_VOLUME_SIZE
  }
  security_groups = [aws_security_group.bastion_sg.id]
}

output "bastion_ip_address" {
  value = aws_instance.bastion.public_ip
}
