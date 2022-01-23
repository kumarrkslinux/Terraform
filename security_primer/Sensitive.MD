```hcl
locals {
  db_password = {
    admin = "password"
  }
}

output "db_password" {
  value = local.db_password
  #sensitive = true
}
```
~~~
/* PS C:\Terraform\UDEMY\security_primer\Sensitive> terraform plan 

Changes to Outputs:
  + db_password = {
      + admin = "password"
    }

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.

*/

/*
C:\Terraform\UDEMY\security_primer\Sensitive> terraform plan  

Changes to Outputs:
  + db_password = (sensitive value)

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.
*/
