variable "domain" {
  description = "Domain to configure for ProtonMail"
  validation {
    condition     = can(regex("^([a-z0-9]+(-[a-z0-9]+)*\\.)+[a-z]{2,}$", var.domain))
    error_message = "Invalid domain name."
  }
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID of the target domain"
}

variable "verification_record" {
  description = "Domain ownership verification record requested by Proton"
  validation {
    condition     = can(regex("protonmail-verification=*", var.verification_record))
    error_message = "Invalid verification record."
  }
}

variable "spf_record" {
  description = "SPF record - only required if you have mutliple mail providers sharing this domain"
  default     = "v=spf1 include:_spf.protonmail.ch mx ~all"
  validation {
    condition     = can(regex("^(v=spf1).*$", var.spf_record))
    error_message = "Invalid SPF record."
  }
}

variable "dkim_1" {
  description = "DKIM record 1 provided by Proton"
  validation {
    condition     = can(regex("^([a-z0-9]+(-[a-z0-9]+)*\\.)+[a-z]{2,}$", var.dkim_1))
    error_message = "Invalid DKIM record."
  }
}

variable "dkim_2" {
  description = "DKIM record 2 provided by Proton"
  validation {
    condition     = can(regex("^([a-z0-9]+(-[a-z0-9]+)*\\.)+[a-z]{2,}$", var.dkim_2))
    error_message = "Invalid DKIM record."
  }
}

variable "dkim_3" {
  description = "DKIM record 3 provided by Proton"
  validation {
    condition     = can(regex("^([a-z0-9]+(-[a-z0-9]+)*\\.)+[a-z]{2,}$", var.dkim_3))
    error_message = "Invalid DKIM record."
  }
}

variable "dmarc_policy" {
  description = "The DMARC policy level to be set (none/quarantine/reject)"
  default     = "quarantine"
  validation {
    condition     = can(regex("^none$|^quarantine$|^reject$", var.dmarc_policy))
    error_message = "DMARC policy must be one of none/quarantine/reject."
  }
}
