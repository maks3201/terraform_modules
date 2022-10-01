variable "project" {
  description = "Project name ()"
  type        = string
  default     = "my-own-project"
}
variable "environment" {
  description = "Environment (dev, prod)"
  type        = string
  default     = "dev"
}
variable "region" {
  description = "AWS region (eu-west-1)"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  type    = string
  default = "dev"
}