provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "github.com/cloud3rsio/terraform-aws-vpc"
  name   = "simple-example"
}
