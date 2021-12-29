# Terraform

- terraform init 
    -  terraform init -upgrade
- terraform plan
- terraform plan -var="instancetype=t2.small" [# command line variable]
- terraform plan -var-file="custom.tfvars" [# file-variable]
- terraform apply
- terraform refresh
- terraform destroy
    - terraform destroy --target github_repository.example
- terraform fmt
