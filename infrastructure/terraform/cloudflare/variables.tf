variable "account_id" {
  description = "Cloudflare account ID for PoolC."
  type        = string
  default     = "96d72c98332c7d9f23618f8ce634bd9e"
}

variable "cloudflare_zero_trust_api_token" {
  description = "Cloudflare API token for Tunnel and Access resources."
  type        = string
  sensitive   = true
}

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

variable "pks_ssh_hostname" {
  description = "Cloudflare Access hostname for SSH access to the PKS master node."
  type        = string
  default     = "pks.dev.poolc.org"
}

variable "pks_ssh_origin" {
  description = "Origin SSH endpoint reachable from the in-cluster cloudflared connector."
  type        = string
  default     = "192.168.0.17:22"
}

variable "pks_ssh_unix_usernames" {
  description = "Unix usernames allowed by the Cloudflare Access SSH policy."
  type        = list(string)
  default     = ["poolc"]
}

variable "pks_ssh_allowed_emails" {
  description = "Email identities allowed to use the PKS SSH Access application."
  type        = list(string)
  default     = ["poolc.official@gmail.com"]
}
