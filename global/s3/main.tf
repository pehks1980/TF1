provider "aws" {
	region = "us-east-1"
}
resource "aws_s3_bucket" "state" {
	#gloablly zone unique name
	bucket = "tf-up-n-running-state-pehks1980"

	versioning {
		enabled = true
	}

	lifecycle {
		prevent_destroy = true
	}
}
