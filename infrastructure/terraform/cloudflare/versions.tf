terraform {
  required_version = ">= 1.5.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_tunnel_api_token
}

provider "cloudflare" {
  alias     = "dns"
  api_token = var.cloudflare_dns_api_token
}
