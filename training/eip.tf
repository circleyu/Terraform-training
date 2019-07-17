resource "aws_eip" "eip" {
	instance = "${aws_instance.bastion.id}"

	tags = {
		Name = "Training EC2 EIP"
	}
}