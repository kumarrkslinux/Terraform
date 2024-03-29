provider "aws"{
    region = "ap-south-1"
    access_key = "key"
    secret_key = "key"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_traffic"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.in_ips]
  }

    ingress {
    from_port        = 53
    to_port          = 53
    protocol         = "tcp"
    cidr_blocks      = [var.in_ips]
  }
    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.in_ips]
  }
}
