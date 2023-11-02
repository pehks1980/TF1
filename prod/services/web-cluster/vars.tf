#prod style vars
variable "cluster_name" {
	description = "aws-sg-elb name"
	default = "webservers-prod" 
	type = string
}

variable "db_remote_state_bucket" {
	description = "S3 bucket name for mysql db remote tfstate " 
	default = "tf-up-n-running-state-pehks1980"
	type = string
}

variable "db_remote_state_bucket_key" {
	description = "S3 bucket key"
	default = "prod/data-stores/mysql/terraform.tfstate" 
	type = string
}

#choose micro:2:2 for prod
variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
  default = "t2.micro"
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
  default = 2
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
  default = 2
}
