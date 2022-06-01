terraform {
  required_providers {
      aws = {
          version = "> 3.10.0"
          source = "hashicorp/aws"
      }
  }
}


provider "aws" {
  profile = "naggar-general"
  region = "us-east-1"
}
