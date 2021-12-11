variable "project_id" {
  type        = string
  description = "The project ID for this Terraform workspace."
}

variable "dns_name" {
  type = string
}

variable "deploy_bucket" {
  type = string
}