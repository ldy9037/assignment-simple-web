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

variable "name" {
  description = "Assume role name"
  default     = "GithubActionsDeploy"
}

variable "github_username" {
  description = "Github user name"
  type        = string
  default     = ""
}

variable "github_repository" {
  description = "Github repository name"
  type        = string
  default     = ""
}

variable "policies" {
  description = "IAM policies for Assume role"
  type        = list(string)
  default     = []
}