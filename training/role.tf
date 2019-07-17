resource "aws_iam_role" "training-ec2-web" {
  name_prefix        = "training-ec2-web-role-"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
  EOF
}

resource "aws_iam_policy" "training-ec2-web" {
  name_prefix = "training-ec2-web-policy-"
  description = "training ec2 web policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
            "s3:GetObject",
            "s3:GetObjectVersion",
            "s3:ListBucket",
            "iam:PassRole"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.s3.arn}/*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "training-ec2-web-attach" {
  role       = "${aws_iam_role.training-ec2-web.name}"
  policy_arn = "${aws_iam_policy.training-ec2-web.arn}"
}

resource "aws_iam_role" "training-code-deploy" {
  name_prefix        = "training-code-deploy-role-"
  assume_role_policy = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "codedeploy.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "training-code-deploy-policy-attachment" {
    role = "${aws_iam_role.training-code-deploy.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

resource "aws_iam_role" "training-bastion-to-s3" {
  name_prefix = "training-bastion-to-s3-role-"
  assume_role_policy = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "training-bastion-to-s3" {
  name_prefix = "training-bastion-to-s3-policy-"
  description = "training bastion to s3 policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
            "ec2:AttachVolume",
            "ec2:AuthorizeSecurityGroupIngress",
            "ec2:CopyImage",
            "ec2:CreateImage",
            "ec2:CreateKeypair",
            "ec2:CreateSecurityGroup",
            "ec2:CreateSnapshot",
            "ec2:CreateTags",
            "ec2:CreateVolume",
            "ec2:DeleteKeypair",
            "ec2:DeleteSecurityGroup",
            "ec2:DeleteSnapshot",
            "ec2:DeleteVolume",
            "ec2:DeregisterImage",
            "ec2:DescribeImageAttribute",
            "ec2:DescribeImages",
            "ec2:DescribeInstances",
            "ec2:DescribeRegions",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeSnapshots",
            "ec2:DescribeSubnets",
            "ec2:DescribeTags",
            "ec2:DescribeVolumes",
            "ec2:DetachVolume",
            "ec2:GetPasswordData",
            "ec2:ModifyImageAttribute",
            "ec2:ModifyInstanceAttribute",
            "ec2:ModifySnapshotAttribute",
            "ec2:RegisterImage",
            "ec2:RunInstances",
            "ec2:StopInstances",
            "ec2:TerminateInstances",
            "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "training-bastion-to-s3-policy-attachment" {
  role = "${aws_iam_role.training-bastion-to-s3.name}"
  policy_arn = "${aws_iam_policy.training-bastion-to-s3.arn}"
}
