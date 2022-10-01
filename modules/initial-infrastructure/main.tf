provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_s3_bucket" "terraform-state" {
  bucket = "${var.project}-${var.environment}-tf-state"
  acl    = "private"
  versioning {
    enabled = true
  }
  #  lifecycle {
  #    prevent_destroy = true
  #  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name        = "Terraform State Storage"
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = "${var.project}-${var.environment}-tf-state-locks"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Table for locking Terraform state files"
    Project     = var.project
    Environment = var.environment
  }
}