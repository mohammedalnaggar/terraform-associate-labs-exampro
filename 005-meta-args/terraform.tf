terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }
}


provider "aws" {
  profile = "naggar-general"
  region  = "us-east-1"

  default_tags {
    tags = {
      deployed_by = "terraform"
      ENV         = "test"
    }
  }

}