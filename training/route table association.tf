resource "aws_route_table_association" "public-2a" {
	subnet_id = "${aws_subnet.public-2a.id}"
	route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public-2b" {
	subnet_id = "${aws_subnet.public-2b.id}"
	route_table_id = "${aws_route_table.public.id}"
}