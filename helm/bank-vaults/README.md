https://bank-vaults.dev/docs/installing/

```
helm --kubeconfig ~/.kube/config-prod3 --namespace vault-operator upgrade --install --wait vault-operator oci://ghcr.io/bank-vaults/helm-charts/vault-operator --create-namespace
prod3 kustomize https://github.com/bank-vaults/vault-operator/deploy/rbac | prod3 apply -f -
prod3 apply -f https://raw.githubusercontent.com/bank-vaults/vault-operator/v1.24.0/deploy/examples/cr-raft.yaml
```

To authenticate to Vault, you can access its root token by running:
`export VAULT_TOKEN=$(kubectl get secrets vault-unseal-keys -o jsonpath={.data.vault-root} | base64 --decode)`


prod3 get secret vault-tls -o jsonpath="{.data.ca\.crt}" | base64 --decode > $PWD/vault-ca.crt
export VAULT_CACERT=$PWD/vault-ca.crt

