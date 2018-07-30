provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "cloud3rsio/vpc/aws"
  name   = "simple-example"
}
