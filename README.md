# k8s-infra
Infrastructure for NYC Mesh's Kubernetes clusters

## Running locally

You'll need `ansible` and `terraform`. You'll also need access to the NYCMesh S3 bucket. This is a set of buckets run by Andrew Dickinson, who can get you credentials.

Copy the env vars to a `.env` file. Some of this can be left blank to disable functionality (like datadog)

```
source .env
```

### Environment Variables

| Variable | Purpose |
|---|---|
| `AWS_ACCESS_KEY_ID` | AWS IAM access key for provisioning cloud resources |
| `AWS_SECRET_ACCESS_KEY` | AWS IAM secret key for provisioning cloud resources |
| `AWS_SESSION_TOKEN` | Temporary AWS session token (for IAM roles with MFA) |
| `BUCKET_TF_STATE` | S3 bucket name for storing Terraform state |
| `TF_VAR_env_name` | Environment name (e.g., `prod3`, `gamma1`) — used to namespace resources |
| `TF_VAR_k3s_token` | Shared secret used by K3s server and agent nodes to authenticate and join the cluster |
| `TF_VAR_mesh_local_password` | Local password for mesh management access |
| `TF_VAR_mesh_proxmox_host` | Proxmox host used to run VMs for the cluster nodes |
| `TF_VAR_mesh_proxmox_token_id` | Proxmox API token ID (e.g., `root@pam!github-k8s-infra`) |
| `TF_VAR_mesh_proxmox_token_secret` | Proxmox API token secret |
| `TF_VAR_longhorn_passphrase` | Encryption passphrase for Longhorn persistent storage |
| `TF_VAR_DATADOG_API_KEY` | Datadog API key for monitoring (leave blank to disable) |
| `TF_VAR_DATADOG_SITE` | Datadog site region (e.g., `datadoghq.com` or `datadoghq.eu`) |
| `TF_VAR_tsig_key` | TSIG key for secure DNS updates (HMAC secret) |
| `TF_VAR_tsig_key_name` | TSIG key name for DNS authentication (e.g., `k8s.lb.prod3`) |
| `TF_VAR_tsig_main_dns_ip` | IP address of the main DNS server for updates |

#### Ansible-specific

| Variable | Purpose |
|---|---|
| `K3S_API_ENDPOINT` | External API endpoint URL for the K3s control plane (used by both servers and agents) |
| `K3S_TOKEN` | Repeats the K3s token for the Ansible playbook (must match `TF_VAR_k3s_token`) |
| `NODE_PORT` | Port range for NodePort services in the cluster |

To set up a cluster, run these terraform commands:

```
terraform init -backend-config=backend.tfvars
terraform plan -var-file=prod3.tfvars
terraform apply -var-file=prod3.tfvars
```

When that completes, run the ansible playbook.

```
ansible-playbook -i inventory.yaml k8s_infra.yaml
```
