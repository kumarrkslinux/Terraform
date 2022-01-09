### Command used 

```hcl

PS C:\Terraform\UDEMY\Modules_Workspace> terraform workspace show

PS C:\Terraform\UDEMY\Modules_Workspace> terraform workspace list

PS C:\Users\krajak111\Desktop\Kumar\Terraform\UDEMY\Modules_Workspace\Workspace> terraform workspace create Dev
Usage: terraform [global options] workspace

  new, list, show, select and delete Terraform workspaces.
Created and switched to workspace "Dev"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state

PS C:\Users\krajak111\Desktop\Kumar\Terraform\UDEMY\Modules_Workspace\Workspace> terraform workspace new Prod
Created and switched to workspace "Prod"!
You're now on a new, empty workspace. Workspaces isolate their state,
for this configuration.
  default
* Prod

PS C:\Terraform\UDEMY\Modules_Workspace> terraform workspace list    
* default
  Dev
  Prod

PS C:\Terraform\UDEMY\Modules_Workspace\Workspace> terraform workspace select Dev
Switched to workspace "Dev".

PS C:\Terraform\UDEMY\Modules_Workspace\Workspace>  terraform workspace show
Dev

PS C:\Terraform\UDEMY\Modules_Workspace\Workspace> terraform fmt
PS C:\Terraform\UDEMY\Modules_Workspace\Workspace> terraform init
PS C:\Terraform\UDEMY\Modules_Workspace\Workspace> terraform validate
PS C:\Terraform\UDEMY\Modules_Workspace\Workspace> terraform plan
PS C:\Terraform\UDEMY\Modules_Workspace\Workspace> terraform workspace show       
default

PS C:\Terraform\UDEMY\Modules_Workspace\Workspace> terraform apply -auto-approve

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
aws_instance.new_vm: Creating...
aws_instance.new_vm: Still creating... [10s elapsed]
aws_instance.new_vm: Still creating... [20s elapsed]
aws_instance.new_vm: Still creating... [30s elapsed]
aws_instance.new_vm: Creation complete after 30s [id=i-0d5d73485a7f69435]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

instancetype = "t2.nano"

```


