provider "aws" {
  region     = "ap-south-1"
  access_key = "key"
  secret_key = "key"
}

resource "aws_eip" "EIP"{
    vpc = true
}

output "oeip" {
    value = aws_eip.EIP.public_ip
}

/*
output "oeip" {
    value = aws_eip.EIP.public_ip
}
*/
