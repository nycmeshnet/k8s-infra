module "some_mesh_cluster" {
  source = "./mesh_cluster"

  mesh_proxmox_node             = var.mesh_proxmox_node
  mesh_proxmox_template_image   = var.mesh_proxmox_template_image
  mesh_proxmox_storage_location = var.mesh_proxmox_storage_location
  mesh_env_name                 = var.mesh_env_name
  mesh_local_user               = var.mesh_local_user
  mesh_mgr_ips                  = var.mesh_mgr_ips
  mesh_mgr_cores                = var.mesh_mgr_cores
  mesh_mgr_ram_mb               = var.mesh_mgr_ram_mb
  mesh_mgr_disk_size            = var.mesh_mgr_disk_size
  mesh_lb_cores                 = var.mesh_lb_cores
  mesh_lb_ram_mb                = var.mesh_lb_ram_mb
  mesh_lb_disk_size             = var.mesh_lb_disk_size
  mesh_ips                      = var.mesh_ips
  mesh_worker_cores             = var.mesh_worker_cores
  mesh_worker_ram_mb            = var.mesh_worker_ram_mb
  mesh_worker_disk_size         = var.mesh_worker_disk_size
  mesh_lb_ip                    = var.mesh_lb_ip
  mesh_lb_internal_ip           = var.mesh_lb_internal_ip
  mesh_gateway                  = var.mesh_gateway
  mesh_networkrange             = var.mesh_networkrange
  bird_network                  = var.bird_network
  bird_ospf_cost                = var.bird_ospf_cost
  mesh_external_ips             = var.mesh_external_ips
  meshdb_fqdn                   = var.meshdb_fqdn
  internal_apps_fqdn            = var.internal_apps_fqdn
  mesh_local_password           = var.mesh_local_password
  longhorn_passphrase           = var.longhorn_passphrase
  k3s_token                     = var.k3s_token
  DATADOG_API_KEY               = var.DATADOG_API_KEY
  DATADOG_SITE                  = var.DATADOG_SITE
  vm_nic                        = var.vm_nic
}
