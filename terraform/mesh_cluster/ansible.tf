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
    EXTERNAL_LISTEN_IPS          = join(";", var.mesh_external_ips)
    mesh_lb_internal_ip          = var.mesh_lb_internal_ip
    INTERNAL_NETWORK_RANGE       = var.mesh_networkrange
    WORKER_IPS                   = join(";", var.mesh_ips)
    NODE_PORT                    = "80"
    BUILDING_NODE_PORT           = "30001"
    AIRFLOW_NODE_PORT            = "30002"
    ESS_NODE_PORT                = "31845"
    MESHDB_FQDN                  = join(",", var.meshdb_fqdn)
    internal_apps_fqdn           = join(",", var.internal_apps_fqdn)
    MESH_DG                      = var.mesh_gateway
    DATADOG_API_KEY              = var.DATADOG_API_KEY
    DATADOG_SITE                 = var.DATADOG_SITE
    bird_router_id               = var.mesh_lb_ip
    bird_network                 = var.bird_network
    BIRD_OSPF_COST               = var.bird_ospf_cost
    tsig_key                     = var.tsig_key
    tsig_key_name                = var.tsig_key_name
    tsig_main_dns_ip             = var.tsig_main_dns_ip
  }
}

# declare your hosts here
resource "ansible_host" "meshmgr" {
  count  = length(var.mesh_mgr_ips)
  name   = var.mesh_mgr_ips[count.index]
  groups = [ansible_group.mgrs.name]
  variables = {
    K3S_API_ENDPOINT    = var.mesh_mgr_ips[0]
    TRAEFIK_TRUSTED_IPs = format("%s/32,%s/32,10.42.0.0/16%s", var.mesh_lb_ip, var.mesh_external_ips[0], length(var.mesh_external_ips) > 1 ? format(",%s/32", var.mesh_external_ips[1]) : "")
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
