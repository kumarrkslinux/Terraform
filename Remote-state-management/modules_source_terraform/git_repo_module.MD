
## Documentation Referred:

https://www.terraform.io/docs/modules/sources.html#github


### Generic GIT Repository:

```hcl
module "newdemomodeules" {
  source = "git::https://github.com/kumarrkslinux/tmp-repo.git"
}
```

### Generic GIT Repository with Specific branch:
```hcl
module "newdemomodeules" {
  source = "git::https://github.com/kumarrkslinux/tmp-repo.git?ref=PROD" #  PROD is branch  and also we can mention the version 
}
```

### GitHub Source:
```hcl
module "newdemomodeules" {
  source = "github.com/kumarrkslinux/new-repo"
}
```

### Initialization Command:
```hcl
terraform init
```
