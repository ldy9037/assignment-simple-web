resource "aws_lb" "main" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  #security_groups    = []
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