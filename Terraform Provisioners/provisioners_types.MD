
## Created-Time Provisioners
They are meant as a means to perform bootstrapping of a system. If a creation-time provisioner fails, the resource is marked as tainted. 
A tainted resource will be planned for destruction and recreation upon the next terraform apply

## Destroy-Time Provisioners
If when = "destroy" is specified, the provisioner will run when the resource it is defined within is destroyed. 
Destroy provisioners are run before the resource is destroyed. If they fail, Terraform will error and rerun the provisioners again on the next terraform apply .

```sh
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
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
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
  }
  provisioner "remote-exec" {
      when  = destroy
    inline = [
      #"sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl stop nginx",
      "sudo apt remove -y nginx"

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

```
# while provision # remote-exec
aws_instance.new_vm (remote-exec): Connecting to remote host via SSH...
aws_instance.new_vm (remote-exec):   Host: x.x.x.x
aws_instance.new_vm (remote-exec):   User: ubuntu
aws_instance.new_vm (remote-exec):   Password: false
aws_instance.new_vm (remote-exec):   Private key: true
aws_instance.new_vm (remote-exec):   Certificate: false
aws_instance.new_vm (remote-exec):   SSH Agent: false
aws_instance.new_vm (remote-exec):   Checking Host Key: false
aws_instance.new_vm (remote-exec):   Target Platform: unix
aws_instance.new_vm (remote-exec): Connected!
aws_instance.new_vm: Still creating... [40s elapsed]
aws_instance.new_vm (remote-exec): Reading package lists... 98%
aws_instance.new_vm (remote-exec): Reading package lists... 98%
aws_instance.new_vm (remote-exec): Reading package lists... 99%
aws_instance.new_vm (remote-exec): Reading package lists... Done
aws_instance.new_vm (remote-exec): Building dependency tree... 0%
aws_instance.new_vm (remote-exec): Building dependency tree... 50%
aws_instance.new_vm (remote-exec): Building dependency tree
aws_instance.new_vm (remote-exec): Reading state information... 0%
aws_instance.new_vm (remote-exec): Reading state information... 0%
aws_instance.new_vm (remote-exec): Reading state information... Done
aws_instance.new_vm (remote-exec): The following additional packages will be installed:
aws_instance.new_vm (remote-exec):   fontconfig-config fonts-dejavu-core
aws_instance.new_vm (remote-exec):   libfontconfig1 libgd3 libjbig0

# while destroy # remote-exec

aws_instance.new_vm (remote-exec): (Reading database ... 95%
aws_instance.new_vm (remote-exec): (Reading database ... 100%
aws_instance.new_vm (remote-exec): (Reading database ... 64122 files and directories currently installed.)
aws_instance.new_vm (remote-exec): Removing nginx (1.18.0-0ubuntu1.2) .
aws_instance.new_vm: Destruction complete after 2m25s
aws_security_group.allow_ssh: Destroying... [id=sg-id]
aws_security_group.allow_ssh: Destruction complete after 0s
Destroy complete! Resources: 2 destroyed.
