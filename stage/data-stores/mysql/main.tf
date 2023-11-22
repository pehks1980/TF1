terraform {
  backend "s3" {
    bucket = "tf-state-pehks19801"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-west-1" 
    encrypt = "true"
  }
}

provider "aws" {
	region = var.aws_region #"us-east-1"
}

module "db_data_store" {
        source = "../../../modules/data-stores/mysql"
        
	dbname  	= var.dbname
	dbuser  	= var.dbuser
	dbpasswd 	= var.dbpasswd

	db_rem_state_bucket 	= var.db_rem_state_bucket
	db_rem_state_bucket_key = var.db_rem_state_bucket_key
	
	db_rds_name 		= var.db_rds_name
	allocated_storage 	= var.allocated_storage
	instance_class 		= var.instance_class 
	aws_region		= var.aws_region
}

