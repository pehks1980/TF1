provider "aws" {
  region = "us-east-1"
}
#branch test
module "web_cluster" {
	#source = "../../../modules/services/web-cluster"
	source = "git::https://github.com/pehks1980/TF1-web_cluster.git//web-cluster?ref=v0.0.3"
	#source = "git::https://github.com/pehks1980/TF1-web_cluster.git//web-cluster?ref=b931cd863276f79721bcd9c1dcc574c5ebe6c6e9"
	cluster_name = var.cluster_name
	db_remote_state_bucket = var.db_remote_state_bucket
	db_remote_state_bucket_key = var.db_remote_state_bucket_key
	#
	instance_type = var.instance_type
	min_size = var.min_size
	max_size = var.max_size
	ami 	 = var.ami
	servertext = "NEW TEXT!!!!!!! v.0.0.3 UPDATED!!! main.tf"
}
