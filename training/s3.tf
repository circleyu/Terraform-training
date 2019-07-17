resource "aws_s3_bucket" "s3" {
      bucket_prefix = "training-s3-bucket-"
      region = "ap-southeast-1"
}
