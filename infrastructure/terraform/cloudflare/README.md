# Cloudflare GitOps

This directory manages only Cloudflare resources used by PKS.

## Current scope

- `*.dev.poolc.org` DNS record for PKS ingress hosts
- `pks.dev.poolc.org` SSH access through a PoolC-owned Cloudflare Tunnel
- Cloudflare Access policy for PKS SSH administrators

The root `poolc.org` site, production PoolC homepage records, AWS/CloudFront
records, mail verification records, and unrelated service records belong outside
the PKS bootstrapping repository.

## Credentials

Do not commit API tokens. Provide a short-lived token at runtime:

```sh
export CLOUDFLARE_API_TOKEN="..."
```

The dev ingress DNS scope needs a Cloudflare API token with:

- Zone: DNS: Edit
- Zone resource: `poolc.org`

The SSH tunnel scope additionally needs:

- Account: Cloudflare Tunnel: Edit
- Account: Access: Apps and Policies: Edit

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
been tested through `pks.dev.poolc.org`.
