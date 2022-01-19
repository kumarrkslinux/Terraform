#### EIP for one()Default and second(profile02) region

### providers.tf
```hcl
provider "aws" {
  region     =  "us-west-1"
}

provider "aws" {
  alias      =  "profile-02"
  region     =  "ap-south-1"
  profile    =  "profile02"
}
```


### eip.tf
```hcl
resource "aws_eip" "myeip" {
  vpc = "true"
}

resource "aws_eip" "myeip01" {
  vpc = "true"
  provider = "aws.profile-02"
}
```



