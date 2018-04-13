# --------------------------------------------------------
# CREATE Route53 record for the instance
# --------------------------------------------------------
resource "aws_route53_zone" "this" {
  name = "${var.zone_name}"
  comment = "${var.description}"
}


resource "aws_route53_record" "this" {
  count = "${length(var.records["names"])}"
  zone_id = "${aws_route53_zone.this.zone_id}"
  name = "${element(var.records["names"], count.index)}${var.zone_name}"
  type = "${element(var.records["types"], count.index)}"
  ttl = "${element(var.records["ttls"], count.index)}"
  records = ["${split(",", element(var.records["values"], count.index))}"]
}

resource "aws_route53_record" "alias" {
  count = "${length(var.alias["names"])}"
  zone_id = "${aws_route53_zone.this.zone_id}"
  name = "${element(var.alias["names"], count.index)}${var.zone_name}"
  type = "A"

  alias {
    name  = "${element(var.alias["values"], count.index)}"
    zone_id = "${element(var.alias["zones_id"], count.index)}"
    evaluate_target_health = false
  }

}
