module "some_mesh_cluster" {
  source = "./mesh_cluster"

  mesh_proxmox_node             = var.mesh_proxmox_node
  mesh_proxmox_template_image   = var.mesh_proxmox_template_image
  mesh_proxmox_storage_location = var.mesh_proxmox_storage_location
  mesh_env_name                 = var.mesh_env_name
  mesh_local_user               = var.mesh_local_user
  mesh_mgr_ips                  = var.mesh_mgr_ips
  mesh_ips                      = var.mesh_ips
  mesh_lb_ip                    = var.mesh_lb_ip
  mesh_gateway                  = var.mesh_gateway
  mesh_networkrange             = var.mesh_networkrange
  mesh_net_block                = var.mesh_net_block
  mesh_external_ip              = var.mesh_external_ip
  meshdb_fqdn                   = var.meshdb_fqdn
  mesh_local_password           = var.mesh_local_password
  k3s_token                     = var.k3s_token
  vm_nic                        = var.vm_nic
}