```hcl
provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

provider "aws" {
  region = "us-west-1"
}


resource "aws_eip" "new_ip1" {
    vpc = "true"
    provider = aws.mumbai
}

resource "aws_eip" "new_ip2" {
    vpc = "true"
}

```

