# Terraform
- terraform fmt
- terraform init 
    -  terraform init -upgrade
    -  terraform init -backend=false
- terraform validate
- terraform plan
- terraform plan -var="instancetype=t2.small" [# command line variable]
- terraform plan -var-file="custom.tfvars" [# file-variable]
- terraform plan -out=ouput 
- terraform plan -refresh=false
- terraform plan -refresh=false -target=aws_security_group.allow_ssh_conn
- terraform apply ouput 
- terraform apply 
- terraform -auto-approve apply
- terraform refresh
- terraform destroy
- terraform -auto-approve destroy
    - terraform destroy --target github_repository.example
- terraform graph > graph.dot
