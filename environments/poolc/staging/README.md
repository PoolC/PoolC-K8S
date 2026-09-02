# PoolC Staging

Argo CD deploys this repository to the `poolc-staging` namespace.

Gitea Actions updates the image digest after each successful frontend or backend build.
Application credentials are stored as SealedSecrets and are not committed in plaintext.
