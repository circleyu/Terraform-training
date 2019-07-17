resource "aws_route_table" "public" {
	vpc_id = "${aws_vpc.vpc.id}"

	tags = {
		Name = "Training Public Route Table"
	}
}