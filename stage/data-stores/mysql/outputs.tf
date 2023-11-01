output "dbaddress" {
	value = "${aws_db_instance.example.address}"
}

output "dbport" {
	value = "${aws_db_instance.example.port}"
}
