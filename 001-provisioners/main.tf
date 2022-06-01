
resource "aws_key_pair" "deployer" {
  key_name   = "terraform-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1F36DoNkGSg9Rx2L4x1NoaxPDAsMyksvCR4FxBx+Vom/JkKIrClRbx6dyxGDVTE4XdagvEqGWp3J76DFfXJcHvKe3EzjeQnF6rFyTX0ptsnK8ch6s9Wig7sgefBA2TIoKrQgA52XEZQ9+Xls/KSuTtbz8/y9RDAzSgFr6gX4BNsnnJJ7zNOKgN1FrQauYu08kQoy0hCCI7K60dScQyqm/M405KskDjFtIdBf44rKTNuK2a+ifGalbG8Hp3vDLRfH4wgeaKn1BSEEVS3+TJfZwJ2HJn9R9OWSAMc/hLKOogqJP3VRIidQiG5bjjRbpkRCI8J6ZR4P1CCwgx81JTzR6e9/EynwLiuifMvE8by5NnI/7U+QFQEGjCK7VeyZXyu+awhenz+uhEzPSwLVmp4lD4STS2LfpXsTZgaR6BIvTSMQaNgRA9h86I2sbTqZhT7+PezDDkVakMeDNxoxvrHoaRKyIlt2XFtbyyNs9cjWPEEkJPJQcDxSQIlsGYayi15k= mohammedalnaggar@Mohammeds-MacBook-Pro.local"
}

data "template_file" "user_data" {
  template = file("./userdata.yaml")
}

resource "aws_instance" "server" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"

  security_groups = ["${aws_security_group.allow_http_ssh.name}"]
  key_name        = aws_key_pair.deployer.key_name

  user_data = data.template_file.user_data.rendered

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> private_ip.txt; echo ${self.private_ip} >> private_ip.txt"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("/Users/mohammedalnaggar/.ssh/terraform")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo Hello Terraform > ~/hello.txt"
    ]
  }

  provisioner "file" {
    source      = "./sg.tf"
    destination = "~/sg.tf"
  }

  tags = {
    "Name" = "terraform-demo-provisioners"
  }

}

resource "null_resource" "status" {
  provisioner "local-exec" {
    command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.server.id}"
  }

  depends_on = [
    aws_instance.server
  ]
}

output "server_public_ip" {
  value = aws_instance.server.public_ip

}