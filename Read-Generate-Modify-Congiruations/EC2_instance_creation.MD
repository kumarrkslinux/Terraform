~~~
provider "aws" {
    region = "ap-south-1"
    access_key = "key"
    secret_key = "key"
}

resource "aws_instance" "new_vm" {
    ami = "ami-0c1a7f89451184c8b"
    instance_type = "t2.micro"
    tags = {
        Name = "PROD_VM"
    }
}

resource "aws_vpc" "new_privte" {
   cidr_block = "10.0.0.0/16"

   tags = {
        Name = "production"
    }
} 

resource "aws_subnet" "new_subnet" {
    vpc_id = aws_vpc.new_privte.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "Prod_subnet"
    }
}
resource "aws_vpc" "dev_vpc" {
   cidr_block = "10.1.0.0/16"

   tags = {
        Name = "dev_vpc"
    }
} 

resource "aws_subnet" "dev_subnet" {
    vpc_id = aws_vpc.dev_vpc.id
    cidr_block = "10.1.0.0/24"

    tags = {
        Name = "dev_subnet"
    }
}
