data "aws_ami" "training-ami" {

  filter {
    name   = "name"
    values = ["packer 1560934820"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["027155467263"] # Canonical   
}
