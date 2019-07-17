resource "aws_iam_instance_profile" "profile" {
  name = "training_profile"
  role = "${aws_iam_role.training-ec2-web.name}"
}

resource "aws_launch_configuration" "config" {
  name_prefix          = "training-configuration-"
  image_id      = "${data.aws_ami.training-ami.image_id}"
  instance_type = "t2.micro"
  key_name = "circle-dev-ap-southeast-1"
  iam_instance_profile = "${aws_iam_instance_profile.profile.name}"
  security_groups = ["${aws_security_group.web-wb.id}","${aws_security_group.private-ssh.id}"]
}

resource "aws_autoscaling_group" "asg" {
  name                 = "training-autoscaling"
  max_size             = 2
  min_size             = 1
  health_check_type    = "ELB"
  desired_capacity     = 2
  launch_configuration = "${aws_launch_configuration.config.name}"
  vpc_zone_identifier  = ["${aws_subnet.public-2a.id}", "${aws_subnet.public-2b.id}"]
  load_balancers = ["${aws_elb.elb.id}"]
  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  tag {
    key                 = "Name"
    value               = "Training ASG EC2"
    propagate_at_launch = true
  }
}