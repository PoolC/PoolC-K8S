# Cloudflare GitOps

This directory manages only Cloudflare resources used by PKS.

## Current scope

- `*.dev.poolc.org` DNS record for PKS ingress hosts
- official PKS service DNS records:
  - `git.poolc.org` (reserved legacy hostname; Gitea service is retired)
  - `argocd.poolc.org`
  - `grafana.poolc.org`

The root `poolc.org` site, production PoolC homepage records, AWS/CloudFront
records, mail verification records, and unrelated service records belong outside
the PKS bootstrapping repository.

## Credentials

Do not commit API tokens. Provide a short-lived token at runtime:

```sh
export TF_VAR_cloudflare_dns_api_token="..."
```

The dev ingress DNS scope needs a Cloudflare API token with:

- Zone: DNS: Edit
- Zone resource: `poolc.org`

## Workflow

```sh
terraform init
terraform plan
terraform apply
```

The DNS record is declared with a Terraform `import` block so Terraform can adopt
the existing record instead of attempting to create a duplicate.

PKS administration uses the internal-network `ssh pks` entry. It does not use a
Cloudflare Tunnel.
