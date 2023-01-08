resource "cloudflare_record" "verification" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = var.verification_record
  type       = "TXT"
}

resource "cloudflare_record" "mx" {
  for_each = {
    "10" = "mail.protonmail.ch"
    "20" = "mailsec.protonmail.ch"
  }
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = each.value
  type       = "MX"
  priority   = each.key
}

resource "cloudflare_record" "dkim" {
  for_each = {
    "protonmail._domainkey" = "${var.dkim_1}"
    "protonmail2._domainkey" = "${var.dkim_2}"
    "protonmail3._domainkey" = "${var.dkim_3}"
  }
  zone_id    = var.cloudflare_zone_id
  name       = "${each.key}.${var.domain}"
  value      = each.value
  type       = "CNAME"
}

resource "cloudflare_record" "spf" {
  zone_id    = var.cloudflare_zone_id
  name       = var.domain
  value      = var.spf_record
  type       = "TXT"
}

resource "cloudflare_record" "dmarc" {
  zone_id    = var.cloudflare_zone_id
  name       = "_dmarc.${var.domain}"
  value      = "v=DMARC1; p=${var.dmarc_policy}"
  type       = "TXT"
}