output "zone_id" {
  value = "${element(compact(concat(list(var.zone_id), aws_route53_zone.this.*.id)), 0)}"
}

output "ns_servers" {
  value = "${aws_route53_zone.this.*.name_servers}"
  depends_on  = [aws_route53_zone.this]
}
