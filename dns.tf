locals {
    mx_records = {
        "10" = "mail.protonmail.ch"
        "20" = "mailsec.protonmail.ch"
    }
    dkim_records = {
        "protonmail._domainkey" = "${var.dkim_1}"
        "protonmail2._domainkey" = "${var.dkim_2}"
        "protonmail3._domainkey" = "${var.dkim_3}"
    }
    txt_records = {
        "verification" = "${var.verification_record}"
        "spf" = "${var.spf_record}"
    }
}

module "mx" {
    source  = "m4xmorris/dns-record/cloudflare"
    version = "1.1.0"
    for_each = {
        for k, v in local.mx_records : k => v
    }
    cloudflare_zone_id = var.cloudflare_zone_id
    name = var.domain
    type = "MX"
    priority = each.key
    value = each.value
}

module "dkim" {
    source  = "m4xmorris/dns-record/cloudflare"
    version = "1.1.0"
    for_each = {
        for k, v in local.dkim_records : k => v
    }
    cloudflare_zone_id = var.cloudflare_zone_id
    name = "${each.key}.${var.domain}"
    type = "CNAME"
    value = each.value
}
  
module "txt" {
    source  = "m4xmorris/dns-record/cloudflare"
    version = "1.1.0"
    for_each = {
        for k, v in local.txt_records : k => v
    }
    cloudflare_zone_id = var.cloudflare_zone_id
    name = "${var.domain}"
    type = "TXT"
    value = each.value
}
  
module "dmarc" {
    source  = "m4xmorris/dns-record/cloudflare"
    version = "1.1.0"
    cloudflare_zone_id = var.cloudflare_zone_id
    name = "_dmarc.${var.domain}"
    type = "TXT"
    value = "v=DMARC1; p=${var.dmarc_policy}"
}
