provider "aws"{
    region = "ap-south-1"
    access_key = "key"
    secret_key = "key"
}

variable "istest"{}

resource "aws_instance" "Dev" {
    ami = "ami-0851b76e8b1bce90b"
    instance_type = "t2.micro"
    count = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
    ami = "ami-0851b76e8b1bce90b"
    instance_type =  "t2.large"
    count = var.istest == false ? 1 : 0 
}
