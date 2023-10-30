
data "aws_availability_zones" "all" {

}

provider "aws" {
  region = "us-east-1"
}

variable "s_port" {
	description = "server listen port (http)"
	default = "8081"
}

resource "aws_launch_configuration" "example" {
	image_id = "ami-40d28157"
	instance_type = "t2.micro"

	security_groups = ["${aws_security_group.instance.id}","${aws_security_group.ssh.id}"]

	key_name  = "myec2key"
	user_data = <<-EOF
		#!/bin/bash
		echo "Hello World" > index.html
		nohup busybox httpd -f -p "${var.s_port}" &
		EOF

	lifecycle {
		create_before_destroy = true
	}
}	

resource "aws_security_group" "instance" {
	name = "tf1-example-instance"
	ingress {
		from_port = "${var.s_port}"
		to_port = "${var.s_port}"
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"] #any IP allowed
	}

	lifecycle {
		create_before_destroy = true
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

	lifecycle {
		create_before_destroy = true
	}
}

#create (A)uto(S)caling(G)roup
resource "aws_autoscaling_group" "example" {
	#get linked launch config with resource ubuntu
	launch_configuration = "${aws_launch_configuration.example.id}"
        #list all zones
	availability_zones = ["${data.aws_availability_zones.all.names[0]}","${data.aws_availability_zones.all.names[1]}"]
	
	#instances range min max for autoscaling
	min_size = 2
	max_size = 3

	tag {
		key = "ASG"
		value = "tf-asg-example"
		propagate_at_launch = true
	}
} 

#output "public_ip" {
#	value = "${aws_instance.example.public_ip}"
#}

