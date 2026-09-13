# PoolC Staging

This environment is deployed to `poolc-staging` by Argo CD and served at
`https://dev.poolc.org`.

Image tags are intentionally pinned in `manifests/kustomization.yaml`. Update
them only after a manually built image has been pushed and verified.

## Prerequisite secret

Before enabling the Argo CD application, provision the `poolc-staging-app`
Secret in the `poolc-staging` namespace. It must contain these keys:

- `db-username`
- `db-password`
- `jwt-secret`
- `email-password`

Never commit that Secret or its plaintext values. The staging database is
`poolc_staging` in the PKS PostgreSQL service.
