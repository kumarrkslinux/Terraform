
```sh
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Terraform/UDEMY/Terraform_provisioners/.aws/credentials"
  profile                 = "new_terraform"
}
resource "aws_instance" "new_vm1" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.new_vm1.private_ip} >> private_ips.txt"
  }
}
