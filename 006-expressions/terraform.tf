terraform {
  required_providers {
      aws = {
          version = "4.0.0"
          source = "hashicorp/aws"
      }
  }
}


provider "aws" {
  profile = "naggar-general"
}
