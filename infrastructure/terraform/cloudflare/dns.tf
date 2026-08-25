resource "cloudflare_dns_record" "wildcard_dev_poolc_org" {
  provider = cloudflare.dns

  zone_id = var.poolc_zone_id
  name    = "*.dev.poolc.org"
  type    = "A"
  content = "165.132.131.121"
  ttl     = 1
  proxied = false
  comment = "vpn용 풀씨 dns 설정"
}

resource "cloudflare_dns_record" "git_poolc_org" {
  provider = cloudflare.dns

  zone_id = var.poolc_zone_id
  name    = "git.poolc.org"
  type    = "A"
  content = var.pks_ingress_ipv4
  ttl     = 1
  proxied = false
  comment = "PKS Gitea ingress"
}

resource "cloudflare_dns_record" "argocd_poolc_org" {
  provider = cloudflare.dns

  zone_id = var.poolc_zone_id
  name    = "argocd.poolc.org"
  type    = "A"
  content = var.pks_ingress_ipv4
  ttl     = 1
  proxied = false
  comment = "PKS Argo CD ingress"
}

resource "cloudflare_dns_record" "mon_poolc_org" {
  provider = cloudflare.dns

  zone_id = var.poolc_zone_id
  name    = "mon.poolc.org"
  type    = "A"
  content = var.pks_ingress_ipv4
  ttl     = 1
  proxied = false
  comment = "PKS Grafana ingress"
}
