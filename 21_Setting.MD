~~~
terraform {
  # required_version = ">= 0.11"
  required_providers {
    aws = "~> 2.0"
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "Key"
  secret_key = "Key"
}

resource "aws_instance" "new_vm" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
}


/*
Terraform_setting> terraform init 

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 2.0"...
- Installing hashicorp/aws v2.70.1...
- Installed hashicorp/aws v2.70.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

*/
