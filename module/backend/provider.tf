terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }

  required_version = "1.1.7"
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = var.tags_environment
      IAC         = var.tags_iac
      Team        = var.tags_team
    }
  }
}