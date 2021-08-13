resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.PROJECT_NAME}-S3-bucket"
  tags = {
    Name        = "${var.PROJECT_NAME}-S3-bucket"
  }
  acl    = "private"
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
}
