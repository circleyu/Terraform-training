resource "aws_instance" "ec2" {
  ami = "ami-0b5a47f8865280111"
  instance_type = "t2.micro"
  key_name = "circle-dev-ap-southeast-1" 

  network_interface {
    network_interface_id = "${aws_network_interface.network.id}"
    device_index         = 0
  }

  tags = {
    Name = "Circle ec2"
  }
}

resource "aws_network_interface" "network" {
  subnet_id   = "${aws_subnet.subnet1.id}"
  security_groups = ["${aws_security_group.sg.id}"]

  tags = {
    Name = "Circle network interface"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.ec2.id}"
  tags = {
    Name = "Circle eip"
  }
}
