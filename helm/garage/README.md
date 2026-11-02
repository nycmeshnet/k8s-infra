# Deploying on Kube

## Generating Secrets

Generate these secrets and put them in `secrets.yaml`

```
rpc_secret = "$(openssl rand -hex 32)"
admin_token = "$(openssl rand -base64 32)"
metrics_token = "$(openssl rand -base64 32)"
```

## Prod1

```
helm --kubeconfig ~/.kube/config-prod1 --namespace garage upgrade --install garage -f garage/secrets.yaml garage
```

### Garage/longhorn troubleshooting

Access the longhorn frontend:
```
prod1 -n longhorn-system port-forward service/longhorn-frontend 8080:80
```
