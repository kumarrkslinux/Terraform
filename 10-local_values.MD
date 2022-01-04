
## locals 
Local values can be helpful to avoid repeating the same values or expressions multiple times in a configuration, 
but if overused they can also make a configuration hard to read by future maintainers by hiding the actual values used.

Use local values only in moderation, in situations where a single value or result is used in many places and that value is likely to be changed in future. 
The ability to easily change the value in a central place is the key advantage of local values.


```sh
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
```
