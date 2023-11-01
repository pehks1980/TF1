terraform {
  backend "s3" {
    bucket = "tf-up-n-running-state-pehks1980"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
    encrypt = "true"
  }
}

provider "aws" {
	region = "us-east-1"
}

resource "aws_db_instance" "example" {
	identifier_prefix = "tf-upnrun"
	skip_final_snapshot = true
	engine = "mysql"
	allocated_storage = 5
	instance_class = "db.t2.micro"
	db_name = var.dbname
	username = "${var.dbuser}"
	password = "${var.dbpasswd}"
}


