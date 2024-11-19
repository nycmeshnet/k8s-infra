# declare your groups here
resource "ansible_group" "mgrs" {
  name = "mgrs"
  variables = {
    ansible_user                 = var.mesh_local_user
    ansible_ssh_private_key_file = "../terraform/${path.module}/mesh${var.mesh_env_name}"
    ansible_ssh_common_args      = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
    K3S_TOKEN                    = var.k3s_token
    DATADOG_API_KEY              = var.DATADOG_API_KEY
    ENV_NAME                     = var.mesh_env_name
    LONGHORN_PASSPHRASE          = var.longhorn_passphrase
  }
}

resource "ansible_group" "workers" {
  name = "workers"
  variables = {
    ansible_user                 = var.mesh_local_user
    ansible_ssh_private_key_file = "../terraform/${path.module}/mesh${var.mesh_env_name}"
    ansible_ssh_common_args      = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
    K3S_TOKEN                    = var.k3s_token
  }
}

resource "ansible_group" "lb" {
  name = "lb"
  variables = {
    ansible_user                 = var.mesh_local_user
    ansible_ssh_private_key_file = "../terraform/${path.module}/mesh${var.mesh_env_name}"
    ansible_ssh_common_args      = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
    EXTERNAL_LISTEN_IP           = var.mesh_external_ip
    LB_HOSTNAME                  = "k8s-lb-${var.mesh_env_name}"
    INTERNAL_NETWORK_BLOCK       = format("%s/%s", var.mesh_net_block, var.mesh_networkrange)
    INTERNAL_NETWORK_RANGE       = var.mesh_networkrange
    WORKER_IPS                   = join(";", var.mesh_ips)
    NODE_PORT                    = "30303"
    MESHDB_FQDN                  = var.meshdb_fqdn
    MESH_DG                      = var.mesh_gateway
    DATADOG_API_KEY              = var.DATADOG_API_KEY
    DATADOG_SITE                 = var.DATADOG_SITE
  }
}

# declare your hosts here
resource "ansible_host" "meshmgr" {
  count  = length(var.mesh_mgr_ips)
  name   = var.mesh_mgr_ips[count.index]
  groups = [ansible_group.mgrs.name]
  variables = {
    K3S_API_ENDPOINT    = var.mesh_mgr_ips[0]
    TRAEFIK_TRUSTED_IPs = format("%s,%s", var.mesh_lb_ip, var.mesh_external_ip)
  }
}

resource "ansible_host" "meshworker" {
  count  = length(var.mesh_ips)
  name   = var.mesh_ips[count.index]
  groups = [ansible_group.workers.name]
  variables = {
    K3S_API_ENDPOINT = var.mesh_mgr_ips[0]
  }
}

resource "ansible_host" "k8slb" {
  name   = var.mesh_lb_ip
  groups = [ansible_group.lb.name]
}
