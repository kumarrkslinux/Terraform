# Terraform
- terraform fmt
- terraform init 
    -  terraform init -upgrade
    -  terraform init -backend=false
    -  terraform init -reconfigure
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
- terraform workspace list
- terraform workspace new stage # new Prod
- terraform workspace select Prod
- terraform state list
- terraform state mv aws_instance.S3new aws_instance.newvm 
- terraform state pull 
- terraform state rm aws_instance.newvm 
- terraform state show aws_iam_user.lb

$env:TF_LOG=""
$env:Path += ";C:\Users\kumar\Desktop\Terrform_new"
