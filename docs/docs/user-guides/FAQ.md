# FAQ

## 1. 갑자기 클러스터 접속이 안 돼요!

높은 확률로 아래 두 가지 문제 중 하나(혹은 모두)가 원인입니다.

1. YSVPN을 활성화하지 않음
2. 클러스터 접근용 토큰 만료

[클러스터 접근용 토큰을 재설정](./README.md#클러스터-접속용-토큰-업데이트)하거나, 외부에서 접속하는 경우 YSVPN이
활성화되었는지 다시 한번 확인해주세요.

## 2. Ingress 리소스 생성이 안 돼요!

아래와 유사한 오류가 발생하며 Ingress 리소스가 생성되지 않는다면, 누군가가 이미 사용 중인 host 및 path 조합으로
Ingress 리소스를 생성하려고 했기 때문입니다.

```text
Error from server (BadRequest):
error when creating "foo.yaml":
admission webhook "validate.nginx.ingress.kubernetes.io" denied the request:
host "ci-cd.demo.internal.poolc" and path "/" is already defined in ingress pks-argocd-demo/demo-server
```

Ingress를 생성하기 이전에는 `kubectl get ingress -A` 명령어를 통해 현재 사용 중인 도메인 이름을 확인한 뒤,
중복되지 않는 값을 사용해주세요.

```console
$ kubectl get ingress -A
NAMESPACE         NAME                            CLASS   HOSTS                             ADDRESS      PORTS   AGE
argocd            argocd-server                   nginx   argocd.poolc.org                  10.99.76.2   80      88d
monitoring        kube-prometheus-stack-grafana   nginx   grafana.poolc.org                 10.99.76.2   80      47h
```

`*.dev.poolc.org` 와일드카드 DNS는 더 이상 제공되지 않습니다. 실습용 Ingress는 내부 네트워크에서
`kubectl port-forward`로 확인하거나, 별도 도메인을 명시적으로 준비해 사용하세요.
