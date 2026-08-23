resource "cloudflare_zero_trust_organization" "poolc" {
  account_id       = var.account_id
  name             = "PoolC"
  auth_domain      = "poolc-pks"
  session_duration = "12h"
}
