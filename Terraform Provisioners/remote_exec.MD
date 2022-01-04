
~~~
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Terraform/UDEMY/Terraform_provisioners/.aws/credentials"
  profile                 = "new_terraform"

}
resource "aws_instance" "new_vm" {
  ami                    = "ami-0851b76e8b1bce90b"
  instance_type          = "t2.micro"
  key_name               = "Terraform"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  provisioner "remote-exec" {
    inline = [
      #"sudo amazon-linux-extras install -y nginx1.12",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type = "ssh"
      user = "ubuntu"
      #user        = "ubuntu"
      private_key = file("./Terraform.pem")
      host        = self.public_ip
    }
  }

}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

~~~
## In AWS, different ec2 instances have different user names. Following are the default usernames of common ec2 instances.
```sh
Instance	Username
Ubuntu	        ubuntu
Redhat Linux	ec2-user
Amazon Linux	ec2-user
CentOS	        centos
Debian	        admin or root
