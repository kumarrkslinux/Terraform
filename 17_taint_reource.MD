### taint

The terraform taint command informs Terraform that a particular object has become degraded or damaged. 
Terraform represents this by marking the object as "tainted" in the Terraform state, and Terraform will propose to replace it in the next plan you create.

```sh 

provider "aws" {
  region     = "ap-south-1"
  access_key = "key"
  secret_key = "key"
}

resource "aws_instance" "new_vm" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
}


$ terraform fmt 
$ terraform init
$ terraform validate 
$ terraform plan -auto-approve
$ terraform apply -auto-approve
$ terraform taint aws_instance.new_vm
$ terraform apply -auto-approve

###  ** From the apply LOG **
Plan: 1 to add, 0 to change, 1 to destroy.
aws_instance.new_vm: Destroying... [id=i-00f287ed0c1344db3]
aws_instance.new_vm: Still destroying... [id=i-00f287ed0c1344db3, 20s elapsed]
aws_instance.new_vm: Still destroying... [id=i-00f287ed0c1344db3, 30s elapsed]
aws_instance.new_vm: Still destroying... [id=i-00f287ed0c1344db3, 40s elapsed]
aws_instance.new_vm: Destruction complete after 40s
aws_instance.new_vm: Creating...
aws_instance.new_vm: Still creating... [10s elapsed]
aws_instance.new_vm: Still creating... [20s elapsed]
aws_instance.new_vm: Still creating... [30s elapsed]
aws_instance.new_vm: Creation complete after 32s [id=i-0fff4f12ae34e8d2d]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
