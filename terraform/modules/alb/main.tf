#############################################
# Application Load Balancer
#############################################

resource "aws_lb" "this" {
  name               = "gaurav-task10-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnet_ids

  tags = {
    Name    = "gaurav-task10-alb"
    Project = "gaurav-task10"
  }
}

#############################################
# Target Group - BLUE
#############################################

resource "aws_lb_target_group" "blue" {
  name     = "gaurav-task10-blue"
  port     = 1337
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"

  health_check {
    path = "/"
  }

  tags = {
    Name    = "gaurav-task10-blue"
    Project = "gaurav-task10"
  }
}

#############################################
# Target Group - GREEN
#############################################

resource "aws_lb_target_group" "green" {
  name     = "gaurav-task10-green"
  port     = 1337
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"

  health_check {
    path = "/"
  }

  tags = {
    Name    = "gaurav-task10-green"
    Project = "gaurav-task10"
  }
}

#############################################
# Listener
#############################################

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue.arn
  }
}