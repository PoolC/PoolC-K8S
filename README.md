<div align="center">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/PoolC/.github/main/profile/assets/poolc.dark.svg" />
  <img src="https://raw.githubusercontent.com/PoolC/.github/main/profile/assets/poolc.vertical.svg" width="100%" alt="PoolC" />
</picture>

PoolC Kubernetes Service의 GitOps 인프라 구성

<img src="https://img.shields.io/badge/Kubernetes-GitOps-326CE5?style=flat-square&logo=kubernetes&logoColor=white" alt="Kubernetes GitOps" />
<img src="https://img.shields.io/badge/Argo%20CD-GitOps-EF7B4D?style=flat-square&logo=argo&logoColor=white" alt="Argo CD" />
<img src="https://img.shields.io/badge/Terraform-Infrastructure-844FBA?style=flat-square&logo=terraform&logoColor=white" alt="Terraform" />

</div>

<br />

## Components

| GitOps | Platform | Services |
| :---: | :---: | :---: |
| Argo CD bootstrap · application manifests | cluster-wide services · configuration | staging workloads · credentials updater |

## Layout

- `bootstrap/` — Argo CD root application
- `platform/` — cluster-wide platform services
- `environments/poolc/staging/` — PoolC staging manifests
- `services/` — supporting services
- `automation/` — operational automation
- `infrastructure/terraform/` — DNS and infrastructure code
- `docs/` — operation guides

## Bootstrap

```bash
kubectl apply -f bootstrap/root-application.yaml
```

Argo CD repository credential와 마이그레이션 계획이 준비된 뒤에만 실행합니다.

## Safety

<img src="https://img.shields.io/badge/State-Remote%20only-D97706?style=flat-square" alt="Remote state only" />
<img src="https://img.shields.io/badge/Secrets-Git%20excluded-DC2626?style=flat-square" alt="Secrets excluded from Git" />

- Terraform state·변수 파일은 Git에 저장하지 않습니다.
- 배포 비밀값은 CI/CD와 외부 secret store에서 관리합니다.
- staging image·DNS 변경은 검토된 GitOps 변경으로만 반영합니다.

## Contributors

<div align="center">

| [Mayne0213](https://github.com/Mayne0213) | [J3m3](https://github.com/J3m3) | [jimmy0006](https://github.com/jimmy0006) |
| :---: | :---: | :---: |
| <img src="https://github.com/Mayne0213.png?size=160" width="88" alt="Mayne0213" /> | <img src="https://github.com/J3m3.png?size=160" width="88" alt="J3m3" /> | <img src="https://github.com/jimmy0006.png?size=160" width="88" alt="jimmy0006" /> |

</div>

---

PoolC 내부 운영 프로젝트입니다.
