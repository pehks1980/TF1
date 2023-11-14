#show dns name
output "public_dns" {
        value = "${aws_lb.example.dns_name}"
}
