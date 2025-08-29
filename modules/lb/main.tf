resource "aws_lb" "ecoshoplb" {
  name = "ecoshop-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [var.SG-Web]
  subnets = var.publicsubnets
  enable_deletion_protection = false

    tags = {
        Name = "ecoshop-alb"
    }
}



resource "aws_lb_target_group" "ecoshoptargetgroup" {
  name = "ecoshop-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id


  health_check {
    path = "/index.php"
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2

  }

    tags = {
        Name = "ecoshop-target-group"
    }
}

resource "aws_lb_target_group_attachment" "appinstance1" {
    target_id = element(var.appinstance, 0)
    target_group_arn = aws_lb_target_group.ecoshoptargetgroup.arn
    port = 80
}

resource "aws_lb_target_group_attachment" "appinstance2" {
    target_id = element(var.appinstance, 1)
    target_group_arn = aws_lb_target_group.ecoshoptargetgroup.arn
    port = 80
}


resource "aws_lb_listener" "httplistener" {
  load_balancer_arn = aws_lb.ecoshoplb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecoshoptargetgroup.arn
  }
}