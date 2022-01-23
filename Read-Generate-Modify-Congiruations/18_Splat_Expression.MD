
```sh

provider "aws" {
  region     = "ap-south-1"
  access_key = "key"
  secret_key = "key"
}

resource "aws_iam_user" "new_user" {
  name  = "iamuser.${count.index}"
  count = 3
  path  = "/system"
}

output "arns" {
  value = aws_iam_user.new_user[*].arn 
}
