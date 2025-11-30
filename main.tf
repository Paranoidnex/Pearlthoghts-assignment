terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_key_pair" "pt_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "pt_sg" {
  name        = var.security_group_name
  description = "PT assignment SG for Strapi"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1337
    to_port     = 1337
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

resource "aws_instance" "PT_Assignment_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name               = aws_key_pair.pt_key.key_name
  vpc_security_group_ids = [aws_security_group.pt_sg.id]
  user_data              = file("user_data.sh")

  tags = {
    Name = "PT-Assignment-Strapi"
  }
}
