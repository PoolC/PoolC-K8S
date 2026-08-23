# Cloudflare GitOps

This directory manages only Cloudflare resources used by PKS.

## Current scope

- `*.dev.poolc.org` DNS record for PKS ingress hosts

The root `poolc.org` site, production PoolC homepage records, AWS/CloudFront
records, mail verification records, and unrelated service records belong outside
the PKS bootstrapping repository.

## Credentials

Do not commit API tokens. Provide a short-lived token at runtime:

```sh
export CLOUDFLARE_API_TOKEN="..."
```

The current DNS scope needs a Cloudflare API token with:

- Zone: DNS: Edit
- Zone resource: `poolc.org`

Tunnel and Access policy management will require additional account-level permissions.

## Workflow

```sh
terraform init
terraform plan
terraform apply
```

The DNS record is declared with a Terraform `import` block so Terraform can adopt
the existing record instead of attempting to create a duplicate.
