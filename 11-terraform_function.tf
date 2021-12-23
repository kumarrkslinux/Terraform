provider "aws"{
    region = var.region
    access_key = "AKIATOGCBCIPIS6AIO45"
    secret_key = "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"
}


variable "region" {
    default = "ap-south-1"
}

variable "ami" {
    type = map
    default = {
        ap-south-1  = "ami-052cef05d01020f1d"
        us-west-2   = "ami-074251216af698218"
        us-west-1   = "ami-01f87c43e618bf8f0" 
}

}

variable "tags" {
    type = list
    default = ["new_instance_01", "new_instance_02"]
}

locals {
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}


resource "aws_instance" "New_vm"{
    ami = lookup(var.ami,var.region) # lookup(map, key, default) 
    instance_type = "t2.micro"
    count = 2

    tags = {
        Name = element(var.tags,count.index) #element(list, index)
    }
}

output "timestamp" {
    value = local.time
}

output "fileout" {
    value = file("${path.module}/terraform_test.txt")
}
