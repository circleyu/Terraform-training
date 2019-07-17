resource "aws_elb" "elb" {
	name = "training-elb"

	# 沒有vpc_id欄位 所以透過subnets來設定
	subnets = ["${aws_subnet.public-2a.id}","${aws_subnet.public-2b.id}"]

	listener {
		instance_port = 80
		instance_protocol = "tcp"
		lb_port = 80
		lb_protocol = "tcp"
	}

	health_check {
		healthy_threshold = 2
		unhealthy_threshold = 2
		timeout = 5
		target = "HTTP:80/host.php"
		interval = 10
	}

	security_groups = ["${aws_security_group.web-lb.id}"]

	tags = {
		Name = "Training ELB"
	}
}