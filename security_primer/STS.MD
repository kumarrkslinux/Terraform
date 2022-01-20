
### AWS command: 
PS C:\Terraform\UDEMY\Project> aws sts assume-role --role-arn arn:aws:iam::xxxxxxxxxxxxxxxxx:role/stsaccesss --role-session-name tsaccesss
{
    "Credentials": {
        "AccessKeyId": "XXXXXXXXXXXXX",
        "SecretAccessKey": "xxxxxxxxxxxxxxxxxxxxx",
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        "Expiration": "2022-01-20T05:05:21+00:00"
    },
    "AssumedRoleUser": {
        "AssumedRoleId": "xxxxxxxxxxxxxxxxxxxx:tsaccesss",
        "Arn": "arn:aws:sts::xxxxxxxxxx:assumed-role/stsaccesss/tsaccesss"
    }
}

```hcl
provider "aws" {
  region = "ap-south-1"
  assume_role {
    role_arn = "arn:aws:iam::xxxxxxxxxxxx:role/stsaccesss"
    session_name = "tsaccesss"
  }
}

variable "username" {
  type    = list(string)
  default = ["Adam", "madhu", "Arun"]
}
resource "aws_iam_user" "example" {
  count = length(var.username)
  name  = var.username[count.index]
  path  = "/system/"
}
```
