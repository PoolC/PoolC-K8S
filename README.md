# PoolC-K8S

GitOps configuration and supporting services for PoolC Kubernetes Service.

## Layout

- `bootstrap/`: Argo CD root application and child application manifests.
- `platform/`: cluster-wide platform services and their configuration.
- `environments/poolc/staging/`: PoolC staging deployment manifests.
- `services/credentials-updater/`: PoolC-K8S account synchronization service.
- `infrastructure/terraform/`: DNS and infrastructure configuration.
- `docs/`: PoolC-K8S operation and user documentation.

## Bootstrap

`bootstrap/root-application.yaml` is the one-time Argo CD entry point. It is not
connected to the running cluster by this repository creation alone. Register the
GitHub repository in Argo CD, then apply the root application after the GitHub
repository credential and migration plan are in place.

## Safety

Terraform state and variable files must remain outside Git. Use the configured
remote state backend and CI secrets for deployment credentials.

The migrated staging manifests intentionally retain their current image and DNS
settings. Move those references to the GitHub Actions image registry as part of
the CI/CD migration, not as an unreviewed repository reorganization.
