# Security group for External ALB / Webserver mapped ALB

resource "aws_security_group" "webservers_alb" {
  tags = {
    Name = "${var.PROJECT_NAME}-webservers-ALB"
  }
  name        = "${var.PROJECT_NAME}-webservers-ALB"
  description = "This security group has mapped with External ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security group for Webserver instances

resource "aws_security_group" "webservers" {
  tags = {
    Name = "${var.PROJECT_NAME}-ec2-webservers"
  }
  name        = "${var.PROJECT_NAME}-ec2-webservers"
  description = "This security group has mapped with webservers ec2 instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.SSH_CIDR_WEB_SERVER]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


# Security group for Internal ALB / Appserver mapped ALB

resource "aws_security_group" "appservers_alb" {
  tags = {
    Name = "${var.PROJECT_NAME}-appservers-ALB"
  }
  name        = "${var.PROJECT_NAME}-appservers-ALB"
  description = "This security group has mapped with Internal ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Security group for Appserver instances

resource "aws_security_group" "appservers" {
  tags = {
    Name = "${var.PROJECT_NAME}-ec2-appservers"
  }
  name        = "${var.PROJECT_NAME}-ec2-appservers"
  description = "This security group has mapped with appservers ec2 instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.SSH_CIDR_APP_SERVER]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Security group for Database

resource "aws_security_group" "rds-sgp" {
  tags = {
    Name = "${var.PROJECT_NAME}-rds-sgp"
  }
  name   = "${var.PROJECT_NAME}-rds-sgp"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.RDS_CIDR]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Security group for Bastion instance

resource "aws_security_group" "bastion_sg" {
  tags = {
    Name = "${var.PROJECT_NAME}-ec2-bastion_sg"
  }
  name        = "${var.PROJECT_NAME}-ec2-bastion_sg"
  description = "This security group has mapped with bastion host ec2 instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.SSH_CIDR_BASTION_HOST]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
