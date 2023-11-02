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
	default = "dbname"
	type = string
}

variable "db_rem_state_bucket" {
        description = "db_rem_state_bucket S3"
	default = "tf-up-n-running-state-pehks1980"
	type = string
}


variable "db_rem_state_bucket_key" {
        description = "db_rem_state_bucket_key file - tfstate"
	default = "stage/data-stores/mysql/terraform.tfstate"
	type = string
}

variable "db_rds_name" {
        description = "db_rds_name ie db_prod"
	default = "db-stage"
	type = string
}

variable "allocated_storage" {
        description = "allocated_storage 5-10 for dbrds"
	default = 5
	type = number
}

variable "instance_class" {
        description = "instance_class - db.t2.micro"
	default = "db.t2.micro"
	type = string
}
