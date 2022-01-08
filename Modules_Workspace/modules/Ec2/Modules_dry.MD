
```sh
resource "aws_instance" "new_vm" {
  ami             = "ami-0851b76e8b1bce90b"
  instance_type   = "t2.micro"
 }
