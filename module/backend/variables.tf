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

variable "state_lock_table_name" {
  description = "Dynamodb table name for tfstate lock"
  type        = string
  default     = "TerraformStateLock"
}

variable "tfstate_bucket" {
  description = "S3 bucket name for tfstate"
  type        = string
  default     = "s3-tfstate-management"
}

variable "log_bucket" {
  description = "S3 bucket name for tfstate log"
  type        = string
  default     = "s3-tfstate-logs"
}

variable "log_key_prefix" {
  description = "To specify a key prefix for tfstate log objects."
  type        = string
  default     = ""
}