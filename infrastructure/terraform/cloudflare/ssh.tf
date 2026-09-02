resource "cloudflare_zero_trust_tunnel_cloudflared" "pks_ssh" {
  account_id = var.account_id
  name       = "pks-ssh"
  config_src = "cloudflare"
}

resource "cloudflare_dns_record" "pks_ssh" {
  provider = cloudflare.dns

  zone_id = var.poolc_zone_id
  name    = var.pks_ssh_hostname
  type    = "CNAME"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.pks_ssh.id}.cfargotunnel.com"
  ttl     = 1
  proxied = true
  comment = "PKS SSH access via Cloudflare Tunnel"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "pks_ssh" {
  account_id = var.account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.pks_ssh.id

  config = {
    ingress = [
      {
        hostname = var.pks_ssh_hostname
        service  = "ssh://${var.pks_ssh_origin}"
      },
      {
        service = "http_status:404"
      }
    ]
  }
}
