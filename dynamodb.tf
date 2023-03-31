#Active lock in on terraform.tfstate and prevent for double access.
resource "aws_dynamodb_table" "terraform-lock" {
  name           = "${var.name_suffix}-${var.environment}-tfstate"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  server_side_encryption {
    enabled = true
  }
  point_in_time_recovery {
    enabled = true
  }
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform State Lock Table"
  }
}

locals {
  # Project tags
  name_suffix = var.resource_tags["Name"]
  environment = var.resource_tags["Environment"]
}
