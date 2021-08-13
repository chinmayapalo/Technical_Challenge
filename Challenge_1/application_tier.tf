
# Launch Configuration for Application servers

resource "aws_launch_configuration" "for_appserver" {
  name          = "appserver-asg-lc"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.APP_SERVER_INSTANCE_TYPE
  root_block_device {
    volume_type = var.APP_SERVER_ROOTBLOCK_VOLUME_TYPE
    volume_size = var.APP_SERVER_ROOTBLOCK_VOLUME_SIZE
  }
  security_groups = [aws_security_group.appservers.id]
  key_name        = var.PEM_FILE_APPSERVERS
  user_data       = file(var.USER_DATA_FOR_APPSERVER)

  # Autoscalling group configuration for Application servers

}


resource "aws_autoscaling_group" "appserver" {
  name                      = "appServer "
  launch_configuration      = aws_launch_configuration.for_appserver.name
  vpc_zone_identifier       = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  target_group_arns         = [aws_lb_target_group.internal_alb.arn]
  health_check_grace_period = var.ASG_APPSERVER_HC_GRACE_PERIOD
  health_check_type         = var.ASG_APPSERVER_HC_TYPE
  desired_capacity          = var.ASG_APPSERVER_DC
  max_size                  = var.ASG_APPSERVER_MAXSIZE
  min_size                  = var.ASG_APPSERVER_MINSIZE
  force_delete              = true

}


#Application load balancer for app server

resource "aws_lb" "internal_alb" {
  name               = "${var.PROJECT_NAME}-Internal-ALB"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.appservers_alb.id]
  subnets            = [aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_1.id]
}

# Adding HTTP listener

resource "aws_lb_listener" "appserver" {
  load_balancer_arn = aws_lb.internal_alb.arn
  port              = var.INT_ALB_LIS_PORT
  protocol          = var.INT_ALB_LIS_PROTOCOL

  default_action {
    target_group_arn = aws_lb_target_group.internal_alb.arn
    type             = var.INT_ALB_ROUTE_TYPE
  }
}

# Adding Target Group

resource "aws_lb_target_group" "internal_alb" {
  name     = "Target-Group-for-internal-ALB"
  port     = var.INT_ALB_TG_PORT
  protocol = var.INT_ALB_TG_PROTOCOL
  vpc_id   = aws_vpc.main.id
}

# ALB endpoint 

output "Application_Load_Balancer_Endpoint" {
  value = aws_lb.internal_alb.dns_name
}
