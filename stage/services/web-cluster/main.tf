provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubu" {
	most_recent = true
	owners = ["099720109477"]
	filter {
		name = "virtualization-type"
		values = ["hvm"]
	}
	
	filter {
		name = "architecture"
		values = ["x86_64"]
	}
	
	filter {
		name = "image-type"
		values = ["machine"]
	}

	filter {
		name = "name"
		values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
	}

}

#branch
module "web_cluster" {
	source = "../../../modules/services/web-cluster"
	#source = "git::https://github.com/pehks1980/TF1-web_cluster.git//web-cluster?ref=test"
	#source = "git::https://github.com/pehks1980/TF1-web_cluster.git//web-cluster?ref=b931cd863276f79721bcd9c1dcc574c5ebe6c6e9"
	cluster_name = var.cluster_name
	db_remote_state_bucket = var.db_remote_state_bucket
	db_remote_state_bucket_key = var.db_remote_state_bucket_key
	#
	instance_type = var.instance_type
	min_size = var.min_size
	max_size = var.max_size
	ami 	 = "${data.aws_ami.ubu.id}"
	servertext = "..-===++!$$NEW TEXT##!++===--.. v.0.0.4 UPDATED!!! module main.tf"
	aws_region = var.aws_region #for s3 config in module
}
