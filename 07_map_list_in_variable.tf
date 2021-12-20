provider "aws"{
    region = "ap-south-1"
    access_key = "key"
    secret_key = "key"
}

resource "aws_instance" "new_new" {
    ami = "ami-0851b76e8b1bce90b"
    #instance_type = var.types[0]
    instance_type =  var.lists["ap-south-1a"]
}

variable "lists" {
    type = list
    default = ["m5.large", "m5.xlarge","t2.medium"]
}

variable "types" {
    type = map
    default = {
        ap-south-1a = "t2.micro"
        ap-south-1b = "t2.nano"
        ap-south-1c = "t2.small" 
}
}
