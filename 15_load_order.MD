#### Terraform loads all the configration files within the directory specified in the alphabet order 


### ec2.tf
```sh

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}

```
### iam_user.tf
```sh

resource "aws_instance" "newec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}
```


### provider.tf

```sh 
provider "aws" {
  region     = "ap-south-1"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}
```

### semantics.tf

```sh
provider "aws" {
  region     = "ap-south-1"
  access_key = "Access-key"
  secret_key = "secret-key"
}

variable "iam_user" {
  default = "newuser"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}

resource "aws_iam_user" "useriam" {
  name = var.iam_user
  path = "/system/"
}
```

### variables.tf
```sh
variable "iam_user" {
  default = "newuser"
}
```
