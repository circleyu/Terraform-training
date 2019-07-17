resource "aws_instance" "bastion" {
	ami = "ami-0b5a47f8865280111"
	instance_type = "t2.micro"
	key_name = "circle-dev-ap-southeast-1"

	iam_instance_profile = "${aws_iam_instance_profile.bastion_profile.name}"

	network_interface {
		network_interface_id = "${aws_network_interface.public.id}"
		device_index = 0
	}

	tags = {
		Name = "Training Bastion"
	}
}

resource "aws_iam_instance_profile" "bastion_profile" {
  name = "bastion_profile"
  role = "${aws_iam_role.training-bastion-to-s3.name}"
}