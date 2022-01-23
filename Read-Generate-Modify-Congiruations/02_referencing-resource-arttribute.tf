provider "aws"{
    region = "ap-south-1"
    access_key = "key"
    secret_key = "key"
}

resource "aws_instance" "new_new" {
    ami = "ami-0851b76e8b1bce90b"
    instance_type = "t2.micro"
}

resource "aws_eip" "EIP" {
    vpc = true
}

resource "aws_eip_association"  "eip_assoc" {
    instance_id = aws_instance.new_new.id
    allocation_id = aws_eip.EIP.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_traffic"
  
 ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.EIP.public_ip}/32"]
  }

}
