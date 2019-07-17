resource "aws_network_interface" "public-2a" {
	subnet_id = "${aws_subnet.public-2a.id}"

	security_groups = [
		"${aws_security_group.private-ssh.id}",
		"${aws_security_group.web-wb.id}",
		]

	tags = {
		Name = "Training Public 2A Netowrk Interface"
	}
}

resource "aws_network_interface" "public-2b" {
	subnet_id = "${aws_subnet.public-2b.id}"

	security_groups = [
		"${aws_security_group.private-ssh.id}",
		"${aws_security_group.web-wb.id}",
		]

	tags = {
		Name = "Training Public 2B Netowrk Interface"
	}
}

resource "aws_network_interface" "public" {
	subnet_id = "${aws_subnet.public-2a.id}"
	security_groups = ["${aws_security_group.public-ssh.id}"]

	tags = {
		Name = "Training Netowrk Interface"
	}
}