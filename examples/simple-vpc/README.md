# Simple VPC

Creates set of VPC resources.

## Usage

```hcl
module "vpc" {
  source = "github.com/cloud3rsio/terraform-aws-vpc"
  name   = "simple-example"
}
```

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```
