Terraform AWS Route53 module
========================

Create a Route53 zone and dns records

Example
-------

```
# Route53 module configuration. This module will create the necessary DNS records.
module "r53_mydomain" {
  source  = "Aplyca/route53/aws"

  description = "DNS records zone for My Domain (mydomain.com)"
  zone_name = "mydomain.com"
  records = {
    names = [
      "www.",
      "admin."
    ]
    types = [
      "CNAME",
      "CNAME"
    ]
    ttls = [
      "3600",
      "3600",
    ]
    values = [
      "mydomain.com",
      "mydomain.com",
    ]
  }

  alias = {
    names = [
      ""
    ]
    values = [
      "d130easdflja734js.cloudfront.net"
    ]
    zones_id = [
      "Z2FDRFHATA1ER4"
    ]
  }
}
```
