provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIATOGCBCIPNDGP62NO"
  secret_key = "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"
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
