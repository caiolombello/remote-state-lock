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

variable "environment" {
  default = "dev"
}

variable "bucket_name" {
  description = "A unique S3 Bucket name"
  type        = string
  default     = "vertigo-devops"
}