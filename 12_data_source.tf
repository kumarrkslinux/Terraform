provider "aws"{
    region = "eu-central-1"
    access_key = "key"
    secret_key = "kay"
}

data "aws_ami" "ubuntu"{
    most_recent = true
    owners = ["099720109477"]

    filter {
        name = "name"
        #values = ["amzn2-ami-hvm-*-x86_64-gp2"]
        values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
            }
}

/*
data "aws_vpc" "default_vpc"{
    default = true
}

resource "aws_subnet" "new_sub"{
    vpc_id = "aws_vpc.default_vpc.id"
    cidr_block = "10.0.0.0/16"
}
*/
resource "aws_instance" "new_vm" {
    ami = "data.aws_ami.ubuntu.id"
    instance_type = "t2.micro"
}
