# k8s-infra
Infrastructure for NYC Mesh's Kubernetes clusters

## Running locally

You'll need `ansible` and `terraform`. You'll also need access to the NYCMesh S3 bucket. This is a set of buckets run by Andrew Dickinson, who can get you credentials.

Copy the env vars to a `.env` file. Some of this can be left blank to disable functionality (like datadog)

```
source .env
```

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
