locals {
  region = "ap-northeast-2"
}

module "backend" {
  source = "./module/backend"

  tags_environment = "common"
  tags_team        = "personal"

  state_lock_table_name = "TerraformStateLock"
  tfstate_bucket        = "s3-tfstate-management"
  log_bucket            = "s3-tfstate-logs"
  log_key_prefix        = "simple-web"

  tfstate_key = "backend/terraform.tfstate"
}

module "oidc_provider_role" {
  source = "./module/oidc"

  name              = "GithubActionsDeploy"
  github_username   = "ldy9037"
  github_repository = "assignment-simple-web"
  policies          = []
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