#terraform {
#  backend "s3" {
#    bucket = var.db_rem_state_bucket #"tf-up-n-running-state-pehks1980"
#    key = var.db_rem_state_bucket_key #"stage/data-stores/mysql/terraform.tfstate"
#    region = "us-east-1"
#    encrypt = "true"
#  }
#}

resource "aws_db_instance" "example" {
	identifier_prefix = "${var.db_rds_name}-tf-upnrun"
	skip_final_snapshot = true
	engine = "mysql"
	allocated_storage = var.allocated_storage
	instance_class = var.instance_class
	db_name = var.dbname
	username = "${var.dbuser}"
	password = "${var.dbpasswd}"
}


