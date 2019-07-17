resource "aws_vpc" "vpc" {
  cidr_block = "10.20.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Circle vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.20.1.0/24"
  tags = {
    Name = "Circle subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.20.2.0/24"
  tags = {
    Name = "Circle subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "10.20.3.0/24"
  tags = {
    Name = "Circle subnet3"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "Circle gateway"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id = "${aws_subnet.subnet1.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id = "${aws_subnet.subnet2.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "c" {
  subnet_id = "${aws_subnet.subnet3.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route" "ipv4-outbound" {
  route_table_id          = "${aws_route_table.r.id}"
  gateway_id              = "${aws_internet_gateway.gw.id}"
  destination_cidr_block  = "0.0.0.0/0"
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "Circle route"
  }
}