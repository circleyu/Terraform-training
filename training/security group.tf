resource "aws_security_group" "public-ssh" {
	name = "Training_public_SSH"
	description = "Training Public SSH Security Group"
	vpc_id = "${aws_vpc.vpc.id}"

	ingress{
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "Training Public SSH"
	}
}

resource "aws_security_group" "private-ssh" {
	name = "Training_private_SSH"
	description = "Training Private SSH Security Group"
	vpc_id = "${aws_vpc.vpc.id}"

	ingress{
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["${aws_vpc.vpc.cidr_block}"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "Training Private SSH"
	}
}

resource "aws_security_group" "web-lb" {
	name = "Training_web_lb"
	description = "Training Web-lb Security Group"
	vpc_id = "${aws_vpc.vpc.id}"

	ingress{
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "Training Web-lb"
	}
}

resource "aws_security_group" "web-wb" {
	name = "Training_web_wb"
	description = "Training Private Web-wb Security Group"
	vpc_id = "${aws_vpc.vpc.id}"

	ingress{
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["${aws_vpc.vpc.cidr_block}"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "Training Web-wb"
	}
}