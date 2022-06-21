resource "aws_s3_bucket" "main" {
  bucket = "aws_s3.main"

  versioning {
    enabled = true
  }

  tags = {
    Name = "aws-terraform"
  }
}
