resource "aws_lb" "main" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.allow_all_egress.id,
    aws_security_group.allow_http_from_all.id,
    aws_security_group.allow_https_from_all.id
  ]
  subnets = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.logs.bucket
    prefix  = "alb/${var.alb_name}"
    enabled = var.alb_log_enble
  }

  depends_on = [
    aws_s3_bucket_policy.alb_logging
  ]
}

resource "aws_lb_target_group" "web_server" {
  name     = var.alb_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.web_server.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_server.arn
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}