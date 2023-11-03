#show dns name
output "public_dns" {
        value = "${module.web_cluster.public_dns}"
}
