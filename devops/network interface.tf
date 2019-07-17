resource "aws_network_interface" "public" {
	subnet_id = "${aws_subnet.public.id}"
	security_groups = ["${aws_security_group.devops-sg.id}"]

	tags = {
		Name = "DevOps Netowrk Interface"
	}
}