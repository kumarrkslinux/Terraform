```hcl
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Terraform/UDEMY/Modules_Workspace/.aws/credentials"
  profile                 = "new_terraform"
}

resource "aws_instance" "new_vm" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map(string)

  default = {
    default = "t2.nano"
    Dev     = "t2.micro"
    Prod    = "t2.large"
  }
}

output "instancetype" {
  value = aws_instance.new_vm.instance_type
}
