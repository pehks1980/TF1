provider "aws" {
  region = "us-east-1"
}

variable "s_port" {
	description = "server listen port (http)"
	default = "8081"
}

resource "aws_instance" "example" {
	ami = "ami-40d28157"
	instance_type = "t2.micro"

	vpc_security_group_ids = ["${aws_security_group.instance.id}","${aws_security_group.ssh.id}"]

	tags = {
    		Name        = "MyEC2Instance"
    		Environment = "Production"
    		Owner       = "John Doe"
  	}
	key_name  = "myec2key"
	user_data = <<-EOF
		#!/bin/bash
		echo "Hello World" > index.html
		nohup busybox httpd -f -p "${var.s_port}" &
		EOF
}	

resource "aws_security_group" "instance" {
	name = "tf1-example-instance"
	ingress {
		from_port = "${var.s_port}"
		to_port = "${var.s_port}"
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"] #any IP allowed
	}
}

resource "aws_security_group" "ssh" {
  name        = "SSHSecurityGroup"
  description = "Allow SSH access"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # You can restrict this to your specific IP range for better security
 }
}

#output "public_ip" {
#	value = "${aws_instance.example.public_ip}"
#}

