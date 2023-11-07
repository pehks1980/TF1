variable "cluster_name" {
	description = "aws-sg-elb name"
	default     = "webservers-stage" 
	type        = string
}

variable "db_remote_state_bucket" {
	description = "S3 bucket name for mysql db remote tfstate " 
	default     = "tf-up-n-running-state-pehks1980"
	type        = string
}

variable "db_remote_state_bucket_key" {
	description = "S3 bucket key"
	default     = "stage/data-stores/mysql/terraform.tfstate" 
	type        = string
}

#choose nano:2:2 for stage
variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
  default     = "t2.nano"
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
  default     = 2
}

variable "ami" {
  description 	= "Ami image name"
  type          = string
  default 	= "ami-40d28157"
}

variable "servertext" {
  description 	= "text to server"
  type          = string
  default 	= "Hello World"
}

