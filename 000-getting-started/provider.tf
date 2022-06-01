
provider "aws" {
  profile = "naggar-general"
    region = "us-east-1"

  alias   = "us"
}

provider "aws" {
  profile = "naggar-general"
  region = "us-east-1"
}

