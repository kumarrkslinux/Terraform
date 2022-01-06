~~~
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Terraform/UDEMY/Terraform_provisioners/.aws/credentials"
  profile                 = "new_terraform"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow ssh connection"

  ingress {
    description = "incoming connection"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    # we have removed the egress and connecting package repo got failed 
  }
}

resource "aws_instance" "new_vm" {
  ami                    = "ami-0851b76e8b1bce90b"
  instance_type          = "t2.micro"
  key_name               = "Terraform"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  provisioner "remote-exec" {
    on_failure = continue # on_failure = fail(by default)
    inline = [
      #"sudo amazon-linux-extras install -y nginx1.12",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx"
    ]
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    #user        = "ubuntu"
    private_key = file("./Terraform.pem")
    host        = self.public_ip
  }
}

~~~~
  
  
## On faliure it create new instance 
~~~
aws_instance.new_vm (remote-exec): 0% [Connecting to security.ubuntu.com (
aws_instance.new_vm (remote-exec): 
aws_instance.new_vm (remote-exec): 0% [Connecting to security.ubuntu.com (
aws_instance.new_vm (remote-exec): 
aws_instance.new_vm (remote-exec): 0% [Connecting to security.ubuntu.com (
aws_instance.new_vm (remote-exec): 
aws_instance.new_vm (remote-exec): 0% [Connecting to security.ubuntu.com (
aws_instance.new_vm (remote-exec): 
aws_instance.new_vm (remote-exec): 0% [Connecting to security.ubuntu.com (
aws_instance.new_vm (remote-exec): E: Failed to fetch http://security.ubuntu.com/ubuntu/pool/main/n/nginx/nginx-core_1.18.0-0ubuntu1.2_amd64.deb  Cannot initiate the connection to archive.ubuntu.com:80 (2001:67c:1360:8001::23). - connect (101: Network is unreachable) Cannot initiate the connection to archive.ubuntu.com:80 (2001:67c:1360:8001::24). - connect (101: Network is unreachable)
aws_instance.new_vm (remote-exec): E: Failed to fetch http://security.ubuntu.com/ubuntu/pool/main/n/nginx/nginx_1.18.0-0ubuntu1.2_all.deb  Cannot initiate the connection to archive.ubuntu.com:80 (2001:67c:1360:8001::23). - connect (101: Network is unreachable) Cannot initiate the connection to archive.ubuntu.com:80 (2001:67c:1360:8001::24). - connect (101: Network is unreachable)
aws_instance.new_vm (remote-exec): E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
aws_instance.new_vm (remote-exec): Failed to start nginx.service: Unit nginx.service not found.

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
