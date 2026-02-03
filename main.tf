provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-04514d500a74cdad8"
  instance_type = "t3.micro"
  key_name      = "key-pair-virginia"

  # USE EXISTING SG HERE
  vpc_security_group_ids = "sg-0d0dcf48f8c348f4d"

  tags = {
    Name = "Ec2-server-auto"
  }
}
