terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "dev" {
    count = 3
    ami = "ami-087c17d1fe0178315"
    instance_type = "t2.micro"
    key_name = "terraform-awsVluiPcHkE5pCpwXrcbGBIx2Ueb81DwbAGvKVa6Jp"

    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["sg-0c4d0e1ecee4e3140"]
 
}
resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"
  vpc_id      = "vpc-0e7a0c4dfcbd8e1f7"

  ingress = [
    {
      description      = "acesso-ssh"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["179.106.43.252/32"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = true
    }
  ]

  tags = {
    Name = "ssh"
  }
}
