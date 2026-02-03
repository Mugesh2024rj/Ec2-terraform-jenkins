# Provider
provider "aws" {
  region = "us-east-1"
}


# Security Group (default VPC)
resource "aws_security_group" "ec2_sg" {
  name        = "simple-ec2-sg"
  description = "Allow SSH, HTTP, HTTPS"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
  resource "aws_instance" "example" {
  ami           = "ami-04514d500a74cdad8"
  instance_type = "t3.micro"
  key_name      = "key-pair-virginia"

  tags = {
    Name = "Ec2-server-auto"
  }
}
