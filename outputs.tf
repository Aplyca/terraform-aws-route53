output "zone_id" {
  value = "${aws_route53_zone.this.id}"
}

output "ns_servers" {
  value = "${aws_route53_zone.this.name_servers}"
}
