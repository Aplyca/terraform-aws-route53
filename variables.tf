variable "description" {
  description = "Description of the DNS Zone"
  default     = ""
}

variable "domain" {
  description = "DNS domain zone"
}

variable "records" {
  type = "map"
  description = "List of DNS Records to add to the DNS zone"
  default = {
    names = []
    types = []
    ttls = []
    values = []
  }
}

variable "alias" {
  type = "map"
  description = "List of DNS Aliases to add to the DNS zone"
  default = {
    names = []
    values = []
    zones_id = []
  }
}
