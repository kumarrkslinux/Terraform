## Enviorment variable

~~~
setx TF_VAR_instancetype=t2.micro [windows]

export TF_VAR_instancetype=t2.micro [Linux]

~~~
## Command line flags
terraform plan -var="instancetype=t2.small" [# command line variable]



