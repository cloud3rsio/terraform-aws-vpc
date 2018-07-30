resource "aws_vpc" "main" {
  count = "${var.create_vpc ? 1 : 0}"

  cidr_block           = "${var.cidr}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags {
    Name         = "${var.name}"
    ModuleSource = "${var.module_source}"
  }
}

resource "aws_internet_gateway" "main" {
  count = "${var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name         = "${var.name}"
    ModuleSource = "${var.module_source}"
  }
}

resource "aws_route_table" "public" {
  count = "${var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name         = "${var.name}-public"
    ModuleSource = "${var.module_source}"
  }
}

resource "aws_route" "public_internet_gateway" {
  count = "${var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0}"

  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.main.id}"
}

resource "aws_subnet" "public" {
  count = "${var.create_vpc && length(var.public_subnets) > 0 || length(var.public_subnets) >= length(var.availability_zones) ? length(var.public_subnets) : 0}"

  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${element(var.public_subnets, count.index)}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags {
    Name         = "${format("%s-public-%s", var.name, element(var.availability_zones, count.index))}"
    ModuleSource = "${var.module_source}"
  }
}

resource "aws_route_table_association" "public" {
  count = "${var.create_vpc && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
