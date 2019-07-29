# --------------------------------------------------------
# CREATE Route53 record for the instance
# --------------------------------------------------------
resource "aws_route53_zone" "this" {
  count = "${var.zone_id == "false" ? 1 : 0}"
  name = "${var.domain}"
  comment = "${var.description}"
}

resource "aws_route53_record" "this" {
  depends_on  = ["aws_route53_zone.this"]
  count = "${var.zone_id == "false" && length(var.records["names"]) > 0 ? length(var.records["names"]) : 0}"
  zone_id = "${var.zone_id != "false" ? var.zone_id : aws_route53_zone.this.0.zone_id}"
  name = "${element(var.records["names"], count.index)}${var.domain}"
  type = "${element(var.records["types"], count.index)}"
  ttl = "${element(var.records["ttls"], count.index)}"
  records = "${split(",", element(var.records["values"], count.index))}"
}

resource "aws_route53_record" "alias" {
  depends_on  = ["aws_route53_zone.this"]
  count = "${var.zone_id == "false" && length(var.alias["names"]) > 0 ? length(var.alias["names"]) : 0}"
  zone_id = "${var.zone_id != "false" ? var.zone_id : aws_route53_zone.this.0.zone_id}"
  name = "${element(var.alias["names"], count.index)}${var.domain}"
  type = "A"

  alias {
    name  = "${element(var.alias["values"], count.index)}"
    zone_id = "${element(var.alias["zones_id"], count.index)}"
    evaluate_target_health = false
  }

}

resource "aws_route53_record" "imported" {
  count = "${var.zone_id != "false" && length(var.records["names"]) > 0 ? length(var.records["names"]) : 0}"
  zone_id = "${var.zone_id}"
  name = "${element(var.records["names"], count.index)}${var.domain}"
  type = "${element(var.records["types"], count.index)}"
  ttl = "${element(var.records["ttls"], count.index)}"
  records = "${split(",", element(var.records["values"], count.index))}"
}

resource "aws_route53_record" "alias_imported" {
  count = "${var.zone_id != "false" && length(var.alias["names"]) > 0 ? length(var.alias["names"]) : 0}"
  zone_id = "${var.zone_id}"
  name = "${element(var.alias["names"], count.index)}${var.domain}"
  type = "A"

  alias {
    name  = "${element(var.alias["values"], count.index)}"
    zone_id = "${element(var.alias["zones_id"], count.index)}"
    evaluate_target_health = false
  }

}