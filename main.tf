locals {
  region = "ap-northeast-2"
}

module "simple_web" {
  source = "./module/simple-web"

  tags_environment = "dev"
  tags_team        = "personal"

  vpc_cidr           = "192.168.1.0/24"
  public_subnets     = ["192.168.1.0/28"]
  private_subnets    = ["192.168.1.16/28"]
  availability_zones = ["${local.region}a"]
}