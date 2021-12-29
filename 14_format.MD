
###Before fmt
~~~
provider "aws"{
    region             = ap-south-1
access_key = "key"
             secret_key = "key"
}


resource "aws_instance" "new_new" {
    ami          = "ami-0851b76e8b1bce90b"
    instance_type = "t2.micro"
}

###After fmt


terraform fmt

> $ terraform fmt

provider "aws" {
  region     = ap-south-1
  access_key = "key"
  secret_key = "key"
}


resource "aws_instance" "new_new" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
}
