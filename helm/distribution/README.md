# Distribution Registry Helm Chart

[Distribution](https://github.com/distribution/distribution) is an open-source project for building a container image registry. This chart installs the Docker Registry v2 on Kubernetes.

## Prerequisites

- Kubernetes 1.25+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure (if using persistence)

## Installing

```bash
helm install my-registry ./helm/distribution
```

## Configuration

The following table lists the configurable parameters of the Distribution chart and their default values.

| Parameter | Description | Default |
|-----------|-------------|---------|
| `image.repository` | Image repository | `distribution/distribution` |
| `image.tag` | Image tag (defaults to Chart.yaml `appVersion`) | `""` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `replicaCount` | Number of replicas | `1` |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Kubernetes service port | `5000` |
| `ingress.enabled` | Enable ingress | `false` |
| `persistence.enabled` | Enable persistent volume | `true` |
| `persistence.size` | PVC size | `10Gi` |
| `persistence.storageClass` | PVC storage class | `""` (uses cluster default) |
| `config` | Registry configuration object | See `values.yaml` |
| `configOverride` | Raw YAML string override for config | `""` |

### Registry Configuration

The `config` block maps directly to the [distribution registry configuration](https://github.com/distribution/distribution/blob/main/cmd/registry/config-example.yml). Un-comment and customize the sections you need in `values.yaml`.

Example — using S3 storage:

```yaml
config:
  version: 0.1
  log:
    level: info
  storage:
    s3:
      region: us-east-1
      bucket: my-registry-bucket
      encrypt: true
    delete:
      enabled: true
    cache:
      blobdescriptor: inmemory
  http:
    addr: :5000
    headers:
      X-Content-Type-Options: [nosniff]
    tls:
      enabled: false
  auth:
    htpasswd:
      realm: basic-realm
      path: /etc/registry/auth
```

### TLS

For TLS, you can either use an Ingress controller or configure the registry directly with a TLS secret:

```yaml
tls:
  enabled: true
  secretName: registry-tls  # Must exist with tls.crt and tls.key
```

## Persistence

By default, the chart provisions a PVC for registry data. Adjust `persistence.size` and `persistence.storageClass` as needed.

## Metrics

Enable metrics to expose debug endpoints for Prometheus scraping:

```yaml
metrics:
  enabled: true
```

The metrics port (`5001`) is exposed and can be scraped by a Prometheus ServiceMonitor if using the Prometheus Operator.

## Example: Production Deployment

```yaml
config:
  version: 0.1
  log:
    level: warn
  storage:
    s3:
      region: us-east-1
      bucket: company-registry
      accesskey: ${AWS_ACCESS_KEY_ID}
      secretkey: ${AWS_SECRET_ACCESS_KEY}
    delete:
      enabled: true
    cache:
      blobdescriptor: inmemory
    maintenance:
      uploadpurging:
        enabled: true
        age: 168h
        interval: 24h
        dryrun: false
  http:
    addr: :5000
    headers:
      X-Content-Type-Options: [nosniff]
    tls:
      enabled: false
  auth:
    htpasswd:
      realm: basic-realm
      path: /etc/registry/auth

persistence:
  enabled: false  # Using S3, no local storage needed

resources:
  requests:
    cpu: 200m
    memory: 512Mi
  limits:
    cpu: 1
    memory: 1Gi
```

## Uninstall

```bash
helm uninstall my-registry
```
