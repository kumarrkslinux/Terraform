## Enviorment variable

setx TF_VAR_instancetype=t2.micro [windows]

export TF_VAR_instancetype=t2.micro [Linux]


## Command line flags
terraform plan -var="instancetype=t2.small" [# command line variable]

## From a file 

terraform plan -var-file="custom.tfvars" [# file-variable]

## Default Variable 

variables.tf [In a file mention the variable details]

variable "instancename" { }

vi terraform.tfvars [In a file mention all the variables]

instancename = "t2.large"





