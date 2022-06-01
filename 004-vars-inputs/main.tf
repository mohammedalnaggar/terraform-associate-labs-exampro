

module "aws_server" {
    source = "./server"
    instance_type = "t2.nano"
}

output "pub_ip" {
    value = module.aws_server.public_ip
}