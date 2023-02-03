variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "tags_environment" {
  description = "Resource environment"
  type        = string
  default     = ""
}

variable "tags_iac" {
  description = "Whether to use IaC"
  type        = string
  default     = "terraform"

}

variable "tags_team" {
  description = "Team that manages the resource"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "192.168.0.0/24"
}

variable "public_subnets" {
  description = "Public subnet CIDR block list"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "Private subnet CIDR block list"
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "List of AZs where subnets will be created"
  type        = list(string)
  default     = []
}

variable "log_bucket" {
  description = "S3 bucket name for simple-web log"
  type        = string
  default     = "s3-simple-web-logs"
}