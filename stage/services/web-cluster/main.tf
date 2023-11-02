provider "aws" {
  region = "us-east-1"
}

module "web_cluster" {
	source = "../../../modules/services/web-cluster"
	cluster_name = var.cluster_name
	db_remote_state_bucket = var.db_remote_state_bucket
	db_remote_state_bucket_key = var.db_remote_state_bucket_key
	#
	instance_type = var.instance_type
	min_size = var.min_size
	max_size = var.max_size
}
