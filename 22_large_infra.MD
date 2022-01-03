~~~ 
provider "aws" {
  region     = "ap-south-1"
  access_key = "key"
  secret_key = "key"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "inbound_ports" {
  type        = list(number)
  description = "All inbound ports"
  default     = [8080, 8081, 8082, 8083]
}

resource "aws_security_group" "inbound_rules" {
  name        = "allow_sg"
  description = "Allow inbound traffic"

  dynamic "ingress" {
    for_each = var.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


resource "aws_instance" "new_vm" {
  ami                    = "ami-0851b76e8b1bce90b"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.inbound_rules.id]
}
~~~ 

### stop refreshing while run plan 
```sh
terraform plan -refresh=false
```
### Setting Refresh along with Target flags
```sh
terraform plan -refresh=false -target=aws_security_group.inbound_rules
``` 
