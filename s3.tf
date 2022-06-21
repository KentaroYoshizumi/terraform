resource "aws_s3_bucket" "main" {
  bucket = "terraform.b"

  versioning {
    enabled = true
  }

  tags = {
    Name = "aws-terraform"
  }
}
