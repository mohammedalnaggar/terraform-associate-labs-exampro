

locals {
  project_name = "naggar"
}


resource "aws_instance" "app_server" {
  ami           = "ami-0022f774911c1d690"
  instance_type = var.instance_type

  tags = {
    Name = "${local.project_name}-server"
  }


}

