resource "aws_subnet" "public-2a" {
	vpc_id = "${aws_vpc.vpc.id}"
	cidr_block = "10.128.11.0/24"
	availability_zone = "ap-southeast-1a"
	map_public_ip_on_launch = true
	tags = {
		Name = "Training Public 2a Subnet"
	}
}

resource "aws_subnet" "public-2b" {
	vpc_id = "${aws_vpc.vpc.id}"
	cidr_block = "10.128.21.0/24"
	availability_zone = "ap-southeast-1b"
	map_public_ip_on_launch = true
	tags = {
		Name = "Training Public 2b Subnet"
	}
}