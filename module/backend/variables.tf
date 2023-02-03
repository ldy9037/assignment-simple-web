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