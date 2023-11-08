variable "dbuser" {
        description = "mysql server username"
        #get from env instad TF_VAR_foo default = "username"
	sensitive = true
	type = string
}

variable "dbpasswd" {
        description = "mysql server user password"
	sensitive = true
	type = string
}

variable "dbname" {
	description = "mysql db name"
	type = string
}

variable "db_rem_state_bucket" {
        description = "db_rem_state_bucket S3"
	type = string
}

variable "db_rem_state_bucket_key" {
        description = "db_rem_state_bucket_key file - tfstate"
	type = string
}

variable "db_rds_name" {
        description = "db_rds_name ie db_prod"
	type = string
}

variable "allocated_storage" {
        description = "allocated_storage 5-10 for dbrds"
	type = number
}

variable "instance_class" {
        description = "instance_class - db.t2.micro"
	type = string
}

variable "aws_region" {
        description = "aws_region"
        type = string
}
