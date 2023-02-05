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

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups = [
      aws_security_group.allow_all_egress.id,
      aws_security_group.allow_http_from_internal.id
    ]
  }

  user_data = filebase64("${path.module}/scripts/run_nginx.sh")
}

resource "aws_autoscaling_group" "web_server" {
  vpc_zone_identifier = [for subnet in aws_subnet.private : subnet.id]
  desired_capacity    = var.asg_desired_capacity
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size

  launch_template {
    id      = aws_launch_template.web_server.id
    version = aws_launch_template.web_server.latest_version
  }

  instance_refresh {
    strategy = "Rolling"
    triggers = ["launch_template"]
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      load_balancers,
      target_group_arns
    ]
  }
}

resource "aws_autoscaling_attachment" "web_server" {
  autoscaling_group_name = aws_autoscaling_group.web_server.id
  lb_target_group_arn    = aws_lb_target_group.web_server.arn
}