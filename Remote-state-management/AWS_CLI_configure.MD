## Configuration and credential file settings
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html 

~~~
~/.aws/credentials

[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
~/.aws/config

[default]
region=us-west-2
output=json
~~~

```sh
PS C:\Terraform\UDEMY\security_primer> aws configure
AWS Access Key ID [****************ZEUE]:
AWS Secret Access Key [****************lGAb]:
Default region name [ap-south-1]:
Default output format [json]:
