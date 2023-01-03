# terraform-cloudflare-protonmail

[Terraform](https://www.terraform.io) module to configure a domain for use with [ProtonMail](https://proton.me/mail), via [Cloudflare](https://cloudflare.com) DNS.

## Usage:
Create a `.tf` file inside your root module to call the module and set variables:
```
module "mail_dns" {
	source = "github.com/m4xmorris/terraform-cloudflare-protonmail.git?ref=v1.0.0" # <-- Change this to the desired version
	domain = ""
	cloudflare_token = ""
	cloudflare_zone_id = ""
	verification_record = ""
	dkim_1 = ""
	dkim_2 = ""
	dkim_3 = ""
}

```
See [variables.tf](variables.tf) for variable descriptions and examples.
