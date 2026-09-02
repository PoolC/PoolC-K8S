# PKS Terraform

Terraform-managed external infrastructure for PKS.

## Directories

- `cloudflare/`: PKS-related Cloudflare DNS, Tunnel, and Access resources

Kubernetes resources remain in `PKS/bootstrapping` and are reconciled by ArgoCD.
This repository is for infrastructure that ArgoCD does not apply directly.
