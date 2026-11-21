# Woodpecker CI

```
helm --kubeconfig ~/.kube/config-prod3 --namespace woodpecker upgrade --install woodpecker oci://ghcr.io/woodpecker-ci/helm/woodpecker --create-namespace -f woodpecker/secrets.yaml -f woodpecker/values.yaml
```

To install Woodpecker CI, use the [Helm Chart](https://github.com/woodpecker-ci/helm).

## Prerequisites

1. Add the Woodpecker Helm repository:
```bash
helm repo add woodpecker https://woodpecker-ci.org/helm-charts
helm repo update
```

2. Create a GitHub OAuth App:
   - Go to **Settings → Developer Settings → GitHub Apps → New OAuth2 App**
   - Set **Authorization callback URL** to: `https://<your-woodpecker-host>/authorize`
   - Copy the **Client ID** and **Client Secret**

3. Create a Kubernetes secret for the credentials:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: woodpecker-github-credentials
  namespace: woodpecker
type: Opaque
stringData:
  client-id: "YOUR_CLIENT_ID"
  client-secret: "YOUR_CLIENT_SECRET"
```

## Installation

```bash
kubectl create ns woodpecker
helm upgrade --install woodpecker woodpecker/woodpecker \
  --namespace woodpecker \
  --create-namespace \
  -f values.yaml
```

## Configuration

See `values.yaml` for full configuration options. Key settings:

- `server.env.WOODPECKER_HOST` - The URL your team will access Woodpecker at
- `server.env.WOODPECKER_ADMIN` - GitHub usernames with admin access (comma-separated)
- `server.env.WOODPECKER_GITHUB_CLIENT/SECRET` - OAuth credentials (use `valueFrom` for secrets)
