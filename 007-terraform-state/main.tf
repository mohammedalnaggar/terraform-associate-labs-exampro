
## demonstrate count and depends-on
resource "aws_instance" "server3" {
  count = 2

  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-server-${count.index}"
  }
}


resource "aws_s3_bucket" "bucket" {

  bucket = "terraform-${random_string.random.id}"

  depends_on = [
    aws_instance.server3[0]
  ]
}


resource "random_string" "random" {
  length = 4
  special = false
  upper = false
}

output "public_ips" {
  value = aws_instance.server3[0].public_ip
  description = "those are the public IPs for the provisioned servers!"
}