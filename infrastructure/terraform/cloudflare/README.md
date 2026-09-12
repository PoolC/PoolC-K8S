# Cloudflare GitOps

This directory manages only Cloudflare resources used by PKS.

## Current scope

- `*.dev.poolc.org` DNS record for PKS ingress hosts
- official PKS service DNS records:
  - `git.poolc.org` (reserved legacy hostname; Gitea service is retired)
  - `argocd.poolc.org`
  - `grafana.poolc.org`
- `pks.poolc.org` SSH tunnel endpoint through a PoolC-owned Cloudflare Tunnel

The root `poolc.org` site, production PoolC homepage records, AWS/CloudFront
records, mail verification records, and unrelated service records belong outside
the PKS bootstrapping repository.

## Credentials

Do not commit API tokens. Provide a short-lived token at runtime:

```sh
export TF_VAR_cloudflare_dns_api_token="..."
export TF_VAR_cloudflare_tunnel_api_token="..."
```

The dev ingress DNS scope needs a Cloudflare API token with:

- Zone: DNS: Edit
- Zone resource: `poolc.org`

The SSH tunnel scope additionally needs:

- Account: Cloudflare Tunnel: Edit

## Workflow

```sh
terraform init
terraform plan
terraform apply
```

The DNS record is declared with a Terraform `import` block so Terraform can adopt
the existing record instead of attempting to create a duplicate.

The SSH tunnel is intended to replace the current personal-account tunnel used by
the local `ssh pks` entry. Keep the old tunnel active until the PoolC tunnel has
been applied, its connector token has been installed in Kubernetes, and SSH has
been tested through `pks.poolc.org`.

## Current migration status

- Created: `pks-ssh` Cloudflare Tunnel
- Created: `pks.poolc.org` DNS record
- Created: remote tunnel config for `ssh://192.168.0.17:22`
- Deployed: `pks-ssh-cloudflared` connector in Kubernetes
- Verified: local `ssh pks` reaches `poolc@poolc-n1` through `pks.poolc.org`

After enabling Access, run `terraform plan` and `terraform apply` again from this
directory to create the Zero Trust organization and SSH Access application.
