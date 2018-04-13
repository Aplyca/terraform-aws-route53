variable "description" {
  description = "Description of the DNS Zone"
  default     = ""
}

variable "zone_name" {
  description = "Zone name."
}

variable "records" {
  type = "map"
  description = "List of DNS Records values to add to the DNS zone"
  default = {
    names = []
    types = []
    ttls = []
    values = []
  }
}

variable "alias" {
  type = "map"
  description = "List of DNS Records types to add to the DNS zone"
  default = {
    names = []
    values = []
    zones_id = []
  }
}
