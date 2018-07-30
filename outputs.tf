output "vpc_id" {
  value = "${element(concat(aws_vpc.main.*.id, list("")), 0)}"
}

output "vpc_cidr_block" {
  value = "${element(concat(aws_vpc.main.*.cidr_block, list("")), 0)}"
}

output "default_security_group_id" {
  value = "${element(concat(aws_vpc.main.*.default_security_group_id, list("")), 0)}"
}

output "default_network_acl_id" {
  value = "${element(concat(aws_vpc.main.*.default_network_acl_id, list("")), 0)}"
}

output "default_route_table_id" {
  value = "${element(concat(aws_vpc.main.*.default_route_table_id, list("")), 0)}"
}

output "vpc_instance_tenancy" {
  value = "${element(concat(aws_vpc.main.*.instance_tenancy, list("")), 0)}"
}

output "vpc_enable_dns_support" {
  value = "${element(concat(aws_vpc.main.*.enable_dns_support, list("")), 0)}"
}

output "vpc_enable_dns_hostnames" {
  value = "${element(concat(aws_vpc.main.*.enable_dns_hostnames, list("")), 0)}"
}

output "vpc_main_route_table_id" {
  value = "${element(concat(aws_vpc.main.*.main_route_table_id, list("")), 0)}"
}

output "public_subnets" {
  value = ["${aws_subnet.public.*.id}"]
}

output "public_subnets_cidr_blocks" {
  value = ["${aws_subnet.public.*.cidr_block}"]
}

output "public_route_table_ids" {
  value = ["${aws_route_table.public.*.id}"]
}

output "igw_id" {
  value = "${element(concat(aws_internet_gateway.main.*.id, list("")), 0)}"
}
