resource "aws_instance" "server" {
  instance_type = var.instance_type
  ami           = "ami-0022f774911c1d690"

  tags = {
    "name" = "terraform-vars-lesson"
  }
}

