## AWS_EC2

~~~
provider "aws" {
    region = "ap-south-1"
    access_key = "key"
    secret_key = "key"
}

# 1. Create VPC
resource "aws_vpc" "prod-vpc" {
    cidr_block = "10.0.0.0/16"
}

# 2. Create Internet Gateway
resource "aws_internet_gateway" "gatewa" {
    vpc_id = aws_vpc.prod-vpc.id

    }
# 3. create Custom Route Table
resource "aws_route_table" "prod-route-table" {
  vpc_id = aws_vpc.prod-vpc.id

  route  {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gatewa.id
    }
  route  {
      ipv6_cidr_block = "::/0"
      gateway_id  = aws_internet_gateway.gatewa.id
    }
  tags = { 
      Name = "internet Gateway"
  }
}
# 4. Create a subnet
resource "aws_subnet" "prod-subnet" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone ="ap-south-1a"

    tags = {
        Name = "prod-subnet"
    }
}
# 5. Associate subnet with Route Tabel
resource "aws_route_table_association" "subnet-associate" {
  subnet_id      = aws_subnet.prod-subnet.id
  route_table_id = aws_route_table.prod-route-table.id
}

# 6. Create Security Group to allow port 22,80,443
resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
      description      = "HTTPS"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
  }
  ingress  {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
   }  
  ingress {
      description      = "SSHD"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
   }  
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  
  tags = {
    Name = "allow_web"
  }
}
# 7. create a network interface with an ip in the subnet tthat was created in step 4
resource "aws_network_interface" "web_nic" {
  subnet_id       = aws_subnet.prod-subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_web.id]
 }
# 8. Assign an elastic IP to the network interface created in step 7
resource "aws_eip" "first" {
  vpc                       = true
  network_interface         = aws_network_interface.web_nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                =  [aws_internet_gateway.gatewa]
}

# 9. create ubuntu server and install/enable apache2
resource "aws_instance" "web-server-instance" {
ami = "ami-0c1a7f89451184c8b"
instance_type = "t2.micro"
availability_zone = "ap-south-1a"
key_name = "Mainkeypair"

network_interface {
      device_index = 0
      network_interface_id = aws_network_interface.web_nic.id
  }

user_data = <<-EOF
             #/bin/bash
             sudo apt update -y 
             sudo apt install apache2 -y
             sudo systemctl start apache2
             sudo bash -c 'echo this is my first web server > /var/www/html/index.html'
             EOF
tags = {
    Name = "web-server"
   }
}

output "Server_public_ip" {
  value = aws_eip.first.public_ip
}
output "Server_private_ip" {
  value = aws_instance.web-server-instance.private_ip
}
