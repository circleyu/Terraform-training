resource "aws_security_group" "devops-sg" {
	name = "DevOps_public_SSH"
	description = "DevOps Security Group"
	vpc_id = "${aws_vpc.vpc.id}"

	ingress{
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress{
		from_port = 3000
		to_port = 3000
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
		Name = "DevOps SG"
	}
}