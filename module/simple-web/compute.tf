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

data "aws_ami" "ubuntu_22" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_launch_template" "web_server" {
  name        = var.launch_template_name
  description = "Web server start template for task execution"

  instance_type           = var.instance_type
  disable_api_termination = true
  image_id                = data.aws_ami.ubuntu_22.image_id
  #security_group_names    = []

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = false
  }
}
