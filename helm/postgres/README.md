# Postgres

We use CloudNativePG.

To install CloudNativePG, use the [Helm Chart](https://github.com/cloudnative-pg/charts/blob/main/charts/cloudnative-pg/README.md).
```
helm  --kubeconfig ~/.kube/config-prod3 repo add cnpg https://cloudnative-pg.github.io/charts
helm --kubeconfig ~/.kube/config-prod3 repo update

helm --kubeconfig ~/.kube/config-prod3 upgrade --install cnpg \
  --namespace cnpg-system \
  --create-namespace \
  cnpg/cloudnative-pg
```

Create the database

```
CREATE DATABASE pano;
CREATE USER pano ENCRYPTED PASSWORD '<password>';
ALTER DATABASE pano OWNER to pano;
```

Then, apply the Helm Chart.

```
prod3 create ns pano
helm --kubeconfig ~/.kube/config-prod3 --namespace pano upgrade --install pano -f pano/secrets-prod3.yaml pano
```
