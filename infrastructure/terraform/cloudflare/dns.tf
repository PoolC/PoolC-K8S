resource "cloudflare_dns_record" "wildcard_dev_poolc_org" {
  zone_id = var.poolc_zone_id
  name    = "*.dev.poolc.org"
  type    = "A"
  content = "165.132.131.121"
  ttl     = 1
  proxied = false
  comment = "vpn용 풀씨 dns 설정"
}
