terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }

  backend "s3" {
    bucket         = "s3-tfstate-management"
    key            = "backend/terraform.tfstate"
    dynamodb_table = "TerraformStateLock"
    region         = "ap-northeast-2"
  }

  required_version = "1.1.7"
}

provider "aws" {
  region = var.region
}