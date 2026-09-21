variable "cloudflare_dns_api_token" {
  description = "Cloudflare API token for poolc.org DNS resources."
  type        = string
  sensitive   = true
}

variable "poolc_zone_id" {
  description = "Cloudflare zone ID for poolc.org."
  type        = string
  default     = "7d4e80f1a45913c5ece5fe89446b9978"
}

variable "pks_ingress_ipv4" {
  description = "Public IPv4 address for PKS ingress-nginx."
  type        = string
  default     = "165.132.131.121"
}
