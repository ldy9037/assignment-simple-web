resource "aws_security_group" "allow_all_egress" {
  name        = "allow-all-egress"
  description = "Allow egress"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group" "allow_http_from_all" {
  name        = "allow-http-from-all"
  description = "Allow external http access"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "http from external"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_https_from_all" {
  name        = "allow-https-from-all"
  description = "Allow external https access"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "https from external"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_http_from_internal" {
  name        = "allow-http-from-internal"
  description = "Allow internal http access"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "http from internal"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
}

