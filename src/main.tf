provider "aws" {
    region = "ap-south-1"
  
}

/*
terraform {
  backend "s3" {
    bucket = var.s3_bucket_name
    key = "ec2-terraform.tfstate"

  }
}
*/
resource "aws_instance" "ec2-instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    "Name" = "tf-github-actions-server"
    "Env" = "Dev"
  }

}



variable "ami_id" {
    type = string
  
}

variable "instance_type" {
    type = string
  
}


output "public_ip" {
    value = aws_instance.ec2-instance.public_ip
  
}



