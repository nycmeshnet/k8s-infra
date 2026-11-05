https://docs.kubebao.org/docs/get-started/install/#install-with-helm

Install the operator

```
export OPERATOR_RELEASE=openbao-operator
export OPERATOR_NAMESPACE=openbao-operator-system
export CHART_VERSION=0.6.0

helm upgrade --install "${OPERATOR_RELEASE}" \
  oci://ghcr.io/kubebao/charts/openbao-operator \
  --version "${CHART_VERSION}" \
  --namespace "${OPERATOR_NAMESPACE}" \
  --values openbao/operator-values.yaml \
  --create-namespace \
  --wait
```

Install this chart

