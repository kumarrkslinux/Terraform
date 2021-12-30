##### taint

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

