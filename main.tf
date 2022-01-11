terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws" {
 
 region = var.region
 access_key= var.access_key
 secret_key= var.secret_key
 
}

data "aws_vpc" "main" {
 id = var.own_vpc
}


resource "aws_security_group" "Security_group_def" {
  name        =  var.security_group_name
  description = var.security_group_description
  vpc_id      = "${data.aws_vpc.main.id}"

  ingress  {
            description      = "HTTP"
            from_port        = 80
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            }
   ingress  {
            description      = "SSH"
            from_port        = 22
            to_port          = 22
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            }
  
  egress {
            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
         }

}
