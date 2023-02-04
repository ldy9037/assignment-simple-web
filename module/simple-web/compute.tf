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
