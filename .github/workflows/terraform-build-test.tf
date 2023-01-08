terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token = "nullnullnullnullnullnullnullnullnullnull"
}

module "terraform_cloudflare_protonmail" {
  source              = "../../."
  domain              = "example.com"
  cloudflare_zone_id  = "null"
  verification_record = "protonmail-verification=null"
  spf_record          = "v=spf1"
  dkim_1              = "dkim1.protontest.com"
  dkim_2              = "dkim2.protontest.com"
  dkim_3              = "dkim3.protontest.com"
  dmarc_policy        = "reject"
}
