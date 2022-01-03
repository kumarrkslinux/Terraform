~~~ 
provider "aws" {
  region     = "ap-south-1"
  access_key = "access_key"
  secret_key = "secret_key"
}

resource "aws_iam_user" "new_user" {
  name  = "iamuser.${count.index}"
  count = 3
  path  = "/system/"
}

output "Iam_names" {
  value = aws_iam_user.new_user[*].name
}

output "Iam_arns" {
  value = aws_iam_user.new_user[*].arn
}

~~~ 



### Terraform_ouput> terraform output Iam_arns

[
  "arn:aws:iam::236630118942:user/system/iamuser.0",
  
  "arn:aws:iam::236630118942:user/system/iamuser.1",
  
  "arn:aws:iam::236630118942:user/system/iamuser.2",
]
### Terraform_ouput> terraform output Iam_names
[
  "iamuser.0",
  
  "iamuser.1",
  
  "iamuser.2",
]

