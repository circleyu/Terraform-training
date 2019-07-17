resource "aws_codedeploy_app" "app" {
  name = "training-codedeploy-app"  
}

resource "aws_codedeploy_deployment_group" "group" {
  app_name = "${aws_codedeploy_app.app.name}"
  deployment_group_name = "master"
  service_role_arn = "${aws_iam_role.training-code-deploy.arn}"
  autoscaling_groups = ["${aws_autoscaling_group.asg.name}"]
}