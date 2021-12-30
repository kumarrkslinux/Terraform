
```sh

provider "aws" {
  region     = "ap-south-1"
  access_key = "key"
  secret_key = "key"
}

resource "aws_instance" "new_vm" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
}

resource "aws_eip" "Ip" {
  instance = aws_instance.new_vm.id
  vpc      = true
}

resource "aws_security_group" "allow_tls" {
  name = "allow_traffic"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.Ip.private_ip}/32"]
  }

}
``` 

## command used 
terraform graph > graph.dot

yum install graphviz

cat graph.dot | dot -Tsvg > graph.svg
