variable "domain" {
    description = "Domain to configure for ProtonMail"
}
variable "cloudflare_token" {
    description = "Cloudflare API Token"
    sensitive = true
  
}
variable "cloudflare_zone_id" {
    description = "Cloudflare Zone ID of the target domain"
  
}
variable "verification_record" {
    description = "Domain ownership verification record requested by Proton"
  
}
variable "spf_record" {
    description = "SPF record - only required if you have mutliple mail providers sharing this domain"
    default = "v=spf1 include:_spf.protonmail.ch mx ~all"
    validation {
      condition = can(regex("^(v=spf1).*$", var.spf_record))
      error_message = "Invalid SPF record format."
    }
  
}
variable "dkim_1" {
    description = "DKIM record 1 provided by Proton"
  
}
variable "dkim_2" {
    description = "DKIM record 2 provided by Proton"
  
}
variable "dkim_3" {
    description = "DKIM record 3 provided by Proton"
  
}
variable "dmarc_policy" {
    description = "The DMARC policy level to be set (none/quarantine/reject)"
    default = "quarantine"
    validation {
      condition = can(regex("^none$|^quarantine$|^reject$", var.dmarc_policy))
      error_message = "DMARC policy must be one of none/quarantine/reject."
    }
  
}