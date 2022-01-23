~~~
provider "aws" {
  region     = "ap-south-1"
  access_key = "key"
  secret_key = "key"
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
    #iterate = port 
    content {
      from_port   = ingress.value
      #from_port   = port.value
      to_port     = ingress.value
      #to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
~~~
