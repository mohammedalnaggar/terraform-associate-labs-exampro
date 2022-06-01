## demonstrate for-each meta-argument

resource "aws_instance" "servers2" {
    ami = "ami-0022f774911c1d690"
    for_each = {
        micro = "t2.micro"
        nano = "t2.nano"
    }

    instance_type = each.value

    tags = {
      "Name" = "${each.key}-server"
    }
}

output "pub-ips" {
  value = values(aws_instance.servers2)[*].public_ip
  # value = aws_instance.servers2["nano"].public_ip

}