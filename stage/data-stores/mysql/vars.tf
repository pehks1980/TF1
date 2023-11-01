variable "dbuser" {
        description = "mysl server username"
        #get from env instad TF_VAR_foo default = "username"
	sensitive = true
}
variable "dbpasswd" {
        description = "mysql server user password"
        #default = "passwd"
	sensitive = true
}
variable "dbname" {
	description = "mysql db name"
	default = "dbname"
}
