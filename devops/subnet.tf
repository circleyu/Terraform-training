resource "aws_subnet" "public" {
	vpc_id = "${aws_vpc.vpc.id}"
	cidr_block = "10.128.11.0/24"
	availability_zone = "ap-southeast-1a"
	map_public_ip_on_launch = true
	tags = {
		Name = "DevOps Public Subnet"
	}
}