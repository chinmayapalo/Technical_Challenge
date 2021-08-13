# Launch Configuration for Webservers

resource "aws_launch_configuration" "for_webserver" {
  name          = "webserver-asg-lc"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.WEB_SERVER_INSTANCE_TYPE
  root_block_device {
    volume_type = var.WEB_SERVER_ROOTBLOCK_VOLUME_TYPE
    volume_size = var.WEB_SERVER_ROOTBLOCK_VOLUME_SIZE
  }
  security_groups = [aws_security_group.webservers.id]
  key_name        = var.PEM_FILE_WEBSERVERS
  user_data       = file(var.USER_DATA_FOR_WEBSERVER)
}

# Autoscalling group configuration for Webservers

resource "aws_autoscaling_group" "webserver" {
  name                      = "WebServers "
  launch_configuration      = aws_launch_configuration.for_webserver.name
  vpc_zone_identifier       = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  target_group_arns         = [aws_lb_target_group.external_alb.arn]
  health_check_grace_period = var.ASG_WEBSERVER_HC_GRACE_PERIOD
  health_check_type         = var.ASG_WEBSERVER_HC_TYPE
  desired_capacity          = var.ASG_WEBSERVER_DC
  max_size                  = var.ASG_WEBSERVER_MAXSIZE
  min_size                  = var.ASG_WEBSERVER_MINSIZE
  force_delete              = true
}

#Application load balancer for webserver
resource "aws_lb" "external_alb" {
  name               = "${var.PROJECT_NAME}-External-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.webservers_alb.id]
  subnets            = [aws_subnet.public_subnet_2.id, aws_subnet.public_subnet_1.id]

}

# Adding HTTP listener

resource "aws_lb_listener" "webserver" {
  load_balancer_arn = aws_lb.external_alb.arn
  port              = var.EXT_ALB_LIS_PORT
  protocol          = var.EXT_ALB_LIS_PROTOCOL

  default_action {
    target_group_arn = aws_lb_target_group.external_alb.arn
    type             = var.EXT_ALB_ROUTE_TYPE
  }
}

# Adding Target Group

resource "aws_lb_target_group" "external_alb" {
  name     = "Target-Group-for-Ext-ALB"
  port     = var.EXT_ALB_TG_PORT
  protocol = var.EXT_ALB_TG_PROTOCOL
  vpc_id   = aws_vpc.main.id
}

# ALB endpoint 

output "Web_Server_Load_Balancer_Endpoint" {
  value = aws_lb.external_alb.dns_name
}
