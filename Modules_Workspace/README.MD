~~~
/* PS C:\Terraform\UDEMY\Modules_Workspace\DRY_principle> terraform plan
╷
│ Error: Module not installed
│
│   on DRY.tf line 1:
│    1: module "new_ec2" {
│
│ This module is not yet installed. Run "terraform init" to install all modules required by this configuration.
╵
PS C:\Terraform\UDEMY\Modules_Workspace\DRY_principle> terraform init
Initializing modules...
- new_ec2 in ..\modules\Ec2

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v3.71.0...
- Installed hashicorp/aws v3.71.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

*/
