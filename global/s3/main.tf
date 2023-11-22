provider "aws" {
	region = "us-west-1" #"us-east-1"
}

resource "aws_s3_bucket" "tf_state" {
	#gloablly zone unique name
	bucket = var.bucket_name #"tf-up-n-running-state-pehks19801"

	#versioning {
	#	enabled = true
	#} deprecated

	#lifecycle {
		#prod
		#prevent_destroy = true
	#}	

	#allow destroy for testing
	force_destroy = true
}

#enabled versioning
resource "aws_s3_bucket_versioning" "enabled" {
	bucket = var.bucket_name
	versioning_configuration {
		status = "Enabled"
	}
}

# Explicitly block all public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = var.bucket_name 
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# track locking tfstate file by use table in DYNAMO DB
# IAM User will need permissions to create S3 buckets and 
# DynamoDB tables, as specified in “Setting Up Your AWS Account”.
resource "aws_dynamodb_table" "tf_locks" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
