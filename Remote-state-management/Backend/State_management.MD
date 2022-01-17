```hcl
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Terraform/UDEMY/Modules_Workspace/.aws/credentials"
  profile                 = "new_terraform"
}

resource "aws_instance" "S3new" {              ## change into newvm
  ami           = "ami-0851b76e8b1bce90b" 
  instance_type = "t2.micro"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
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



### state Management commands
~~~

### List the state files
```sh
PS C:\Terraform\UDEMY\Remote-state-management\Backend> terraform state list
aws_iam_user.lb
aws_instance.S3new
```

#### Rename Resource within Terraform State
1. Change the local name of EC2 resource from webapp to newvm. 
2. Run terraform plan to see the changes. It should destroy and recreate the EC2 instance.
3. Change the local name of EC2 within the terraform state file with following command:

### move the state files 
```sh
PS C:\Terraform\UDEMY\Remote-state-management\Backend> terraform state mv aws_instance.S3new aws_instance.newvm     
Move "aws_instance.S3new" to "aws_instance.newvm"
Successfully moved 1 object(s).
Releasing state lock. This may take a few moments...
```

### Show Attributes of Resource from state file
```sh
PS C:\Terraform\UDEMY\Remote-state-management\Backend> terraform state show aws_iam_user.lb
# aws_iam_user.lb:
resource "aws_iam_user" "lb" {
    arn           = "arn:aws:iam::236630118942:user/system/loadbalancer"
    force_destroy = false
    id            = "loadbalancer"
    name          = "loadbalancer"
    path          = "/system/"
    tags_all      = {}
    unique_id     = "ID"
}


```sh
#### Pull Current State file
```
terraform state pull

```sh
#### Remove Items from State file
terraform state rm aws_instance.myec2 
```

