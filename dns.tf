# Mail service records
resource "cloudflare_record" "verification" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = var.verification_record
  type       = "TXT"
}
resource "cloudflare_record" "mx_1" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "mail.protonmail.ch"
  type       = "MX"
  priority   = "10"
}
resource "cloudflare_record" "mx_2" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = "mailsec.protonmail.ch"
  type       = "MX"
  priority   = "20"
}
resource "cloudflare_record" "spf" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = var.spf_record
  type       = "TXT"
}
resource "cloudflare_record" "dkim_1" {
  zone_id    = var.cloudflare_zone_id
  name       = "protonmail._domainkey.${var.domain}"
  value      = var.dkim_1
  type       = "CNAME"
}
resource "cloudflare_record" "dkim_2" {
  zone_id    = var.cloudflare_zone_id
  name       = "protonmail2._domainkey.${var.domain}"
  value      = var.dkim_2
  type       = "CNAME"
}
resource "cloudflare_record" "dkim_3" {
  zone_id    = var.cloudflare_zone_id
  name       = "protonmail3._domainkey.${var.domain}"
  value      = var.dkim_3
  type       = "CNAME"
}
resource "cloudflare_record" "dmarc" {
  zone_id    = var.cloudflare_zone_id
  name       = "_dmarc.${var.domain}"
  value      = "v=DMARC1; p=${var.dmarc_policy}"
  type       = "TXT"
}
