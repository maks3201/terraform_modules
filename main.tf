
provider "aws" {
  region  = var.region
  profile = var.profile
}

terraform {
  backend "s3" {

    bucket  = ""
    key     = "dev/modules/terraform.tfstate"
    region  = "us-east-1"
    profile = ""

    dynamodb_table = ""
    encrypt        = true
  }
}
