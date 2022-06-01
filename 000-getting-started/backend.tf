

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.14.0"
    }
  }
}


# terraform {
#   backend "remote" {
#     organization = "naggar"

#     workspaces {
#       name = "terraform-demos"
#     }
#   }
# }