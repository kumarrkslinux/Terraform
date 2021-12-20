
provider "aws"{
    region = "ap-south-1"
    access_key = "key"
    secret_key = "key"
}

resource "aws_iam_user" "new_user" {
  name = var.username
  path = "/system/"
}
