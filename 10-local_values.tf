provider "aws" {
    region = "ap-south-1"
    access_key = "key"
    secret_key = "key"
}

locals {
 # name_prefix = "${var.name != "" ? var.name : var.default}"
    common_tags = {
        owner = "Devops Team"
        service = "backend"
    }
}

resource "aws_instance" "new_vm_0" {
    ami = "ami-0851b76e8b1bce90b"
    instance_type = "t2.micro"  
    tags = local.common_tags
}

resource "aws_instance" "new_vm_1" {
    ami = "ami-0851b76e8b1bce90b"
    instance_type = "t2.small"  
    tags = local.common_tags
}

resource "aws_ebs_volume" "new_volume" {
    availability_zone = "ap-south-1a"
    size = 8
    tags = local.common_tags
}
