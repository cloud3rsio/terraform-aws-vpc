# AWS VPC Terraform module

Terraform module which creates VPC resources on AWS.

These types of resources are supported:

* [VPC](https://www.terraform.io/docs/providers/aws/r/vpc.html)
* [Subnet](https://www.terraform.io/docs/providers/aws/r/subnet.html)
* [Route](https://www.terraform.io/docs/providers/aws/r/route.html)
* [Route table](https://www.terraform.io/docs/providers/aws/r/route_table.html)
* [Internet Gateway](https://www.terraform.io/docs/providers/aws/r/internet_gateway.html)

## Usage

```hcl
module "vpc" {
  source = "cloud3rsio/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  availability_zones = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  public_subnets     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]

  enable_dns_hostnames   = true
  enable_dns_support      = true
  map_public_ip_on_launch = true
}
```

## Examples

* [Simple VPC](./examples/simple-vpc/)

## License

Apache 2 Licensed. See LICENSE for full details.
