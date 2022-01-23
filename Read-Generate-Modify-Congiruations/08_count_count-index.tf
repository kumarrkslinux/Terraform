provider "aws"{
    region = "ap-south-1"
    access_key = "key"
    secret_key = "key"
}

/*
resource "aws_iam_user" "new_user" {
  name = loadbalancer.${count.index}"
  count = 3
  path = "/system/"
}
*/

variable "elb_name" {
    type = list
    default = ["dev.loadbalancer", "staging.loadbalancer", "prod.loadbalancer"]
}

resource "aws_iam_user" "new_user" {
  name = var.elb_name[count.index]
  count = 3
  path = "/system/"
}
