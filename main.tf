# main.tf

# Define the cloud provider
provider "aws" {
  region = "us-east-1"
}

# 1. Create the S3 Bucket
resource "aws_s3_bucket" "finance_data" {
  bucket = "lums-confidential-finance-records"
}

# 2. THE FIX: Completely block all public access
resource "aws_s3_bucket_public_access_block" "secure_finance_data" {
  bucket = aws_s3_bucket.finance_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 3. THE FIX: Enable Versioning (So if data is deleted, you have a backup)
resource "aws_s3_bucket_versioning" "finance_data_versioning" {
  bucket = aws_s3_bucket.finance_data.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 4. THE FIX: Enable Server-Side Encryption (Data is scrambled at rest)
resource "aws_s3_bucket_server_side_encryption_configuration" "finance_data_encryption" {
  bucket = aws_s3_bucket.finance_data.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}