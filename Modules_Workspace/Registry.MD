### https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest (verified modules)


```hcl
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Terraform/UDEMY/Modules_Workspace/.aws/credentials"
  profile                 = "new_terraform"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name           = "single-instance"
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  subnet_id     = "subnet-63e61808"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```
