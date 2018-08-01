variable "module_source" {
  default = "github.com/cloud3rsio/terraform-aws-vpc"
}

variable "create_vpc" {
  default = true
}

variable "name" {
  default = "terraform-aws-vpc"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  default = "default"
}

variable "public_subnets" {
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = []

  //default = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
}

variable "availability_zones" {
  default = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

variable "enable_dns_hostnames" {
  default = true
}

variable "enable_dns_support" {
  default = true
}

variable "map_public_ip_on_launch" {
  default = true
}

variable "tags" {
  default = {}
}
