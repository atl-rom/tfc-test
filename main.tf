

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