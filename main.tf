terraform {
  required_version = "~> 0.14.7"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "atl-rom"
    workspaces {
      name = "tfc"
    }
  }
}



provider "aws" {
    region = "us-west-2"
  
}
resource "aws_instance" "base"{

    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
}


data "aws_ami" "ubuntu" { 
most_recent = true 
filter { 
name = "name" 
values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] 
} 
filter { 
name = "virtualization-type" 
values = ["hvm"] 
} 
owners = ["099720109477"] # Canonical }
}