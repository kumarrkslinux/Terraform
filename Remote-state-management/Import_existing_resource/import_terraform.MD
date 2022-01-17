```hcl
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Terraform/UDEMY/Modules_Workspace/.aws/credentials"
  profile                 = "new_terraform"
}

resource "aws_instance" "terraform_import" {
  ami                   = "ami-059a9b1093495222c"
  instance_type         = "t2.micro"
  vpc_security_group_ids = ["sg-0a16e064b7510255e"]
  subnet_id             = "subnet-63e61808"
  
  tags {
    Name = "terraform_import"
  }
}
```

### Import excecution 

```sh
PS C:\Terraform\UDEMY\Remote-state-management\Import_existing_resource> terraform fmt 

PS C:\Terraform\UDEMY\Remote-state-management\Import_existing_resource> terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v3.72.0...
- Installed hashicorp/aws v3.72.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```sh
PS C:\Terraform\UDEMY\Remote-state-management\Import_existing_resource> terraform validate
Success! The configuration is valid.
```

```sh
PS C:\Terraform\UDEMY\Remote-state-management\Import_existing_resource> terraform import aws_instance.terraform_import i-0d0cfd8b8a7cab8b9 
aws_instance.terraform_import: Importing from ID "i-0d0cfd8b8a7cab8b9"...
  Prepared aws_instance for import
aws_instance.terraform_import: Refreshing state... [id=i-0d0cfd8b8a7cab8b9]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

```sh
PS C:\Terraform\UDEMY\Remote-state-management\Import_existing_resource> terraform plan
aws_instance.terraform_import: Refreshing state... [id=i-0d0cfd8b8a7cab8b9]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.terraform_import will be updated in-place
  ~ resource "aws_instance" "terraform_import" {
        id                                   = "i-0d0cfd8b8a7cab8b9"
      ~ tags                                 = {
          - "Name" = "terraform_import" -> null
        }
      ~ tags_all                             = {
          - "Name" = "terraform_import"
        } -> (known after apply)
        # (27 unchanged attributes hidden)

        # (6 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

```
