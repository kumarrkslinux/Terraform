# Terraform

- terraform init 
    -  terraform init -upgrade
    -  terraform init -backend=false
- terraform plan
- terraform plan -var="instancetype=t2.small" [# command line variable]
- terraform plan -var-file="custom.tfvars" [# file-variable]
- terraform apply
- terraform -auto-approve apply
- terraform refresh
- terraform destroy
- terraform -auto-approve destroy
    - terraform destroy --target github_repository.example
- terraform fmt
- terraform validate
- terraform graph > graph.dot
