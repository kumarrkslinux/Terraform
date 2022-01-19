```hcl
#variables.tf
provider "aws" {
  region = "ap-south-1"
}

variable "username" {
  type    = list(string)
  default = ["Adam", "David", "Moses"]
}
#main.tf
resource "aws_iam_user" "example" {
  count = length(var.username)
  name  = var.username[count.index]
  path  = "/system/"
}
```
