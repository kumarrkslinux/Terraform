~~~ 
provider "aws" {
  region     = "ap-south-1"
  access_key = "key"
  secret_key = "key"
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

output "Join" {
  value = zipmap(aws_iam_user.new_user[*].name, aws_iam_user.new_user[*].arn)
}
~~~ 


### Output 
/*
Join = {
  "iamuser.0" = "arn:aws:iam::236630118942:user/system/iamuser.0"
  
  "iamuser.1" = "arn:aws:iam::236630118942:user/system/iamuser.1"
  
  "iamuser.2" = "arn:aws:iam::236630118942:user/system/iamuser.2"
  
  /*
