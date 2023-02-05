resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_subnets, count.index)
  availability_zone = length(var.availability_zones) > 0 ? element(var.availability_zones, count.index) : null
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = length(var.availability_zones) > 0 ? element(var.availability_zones, count.index) : null
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat_ip" {}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public[0].id

  depends_on = [aws_internet_gateway.main]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

data "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "web_server" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "simple-web.${data.aws_route53_zone.main.name}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.main.dns_name]
}

resource "aws_acm_certificate" "web_server" {
  domain_name       = aws_route53_record.web_server.fqdn
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}