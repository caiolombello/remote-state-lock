variable "aws_region" {

  type        = string
  description = ""
  default     = "us-east-1"

}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    Environment = "dev",
    Terraform   = "true"
    Name        = "vertigo-devops"
  }
}

locals {
  # Project tags
  name_suffix = var.resource_tags["Name"]
  environment = var.resource_tags["Environment"]
}
