### With out locking state file
```hcl
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Terraform/UDEMY/Modules_Workspace/.aws/credentials"
  profile                 = "new_terraform"
}

resource "aws_eip" "Elastic_IP" {
  vpc = "true"
}

terraform {
  backend "s3" {
    bucket = "kumarnewbucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    access_key = "Key"
    secret_key = "Key"
  }
}
```

### With Dynamo locking state file 

```hcl

provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Terraform/UDEMY/Modules_Workspace/.aws/credentials"
  profile                 = "new_terraform"
}

resource "aws_eip" "Elastic_IP" {
  vpc = "true"
}

terraform {
  backend "s3" {
    bucket = "kumarbucketnew"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    access_key = "key"
    secret_key = "key"
    dynamodb_table = "locking-db-s3"
  }
}
```


