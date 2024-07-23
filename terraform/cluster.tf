module "some_meshdb_cluster" {
  source = "./meshdb_cluster"

  meshdb_proxmox_node             = var.meshdb_proxmox_node
  meshdb_proxmox_template_image   = var.meshdb_proxmox_template_image
  meshdb_proxmox_storage_location = var.meshdb_proxmox_storage_location
  meshdb_env_name                 = var.meshdb_env_name
  meshdb_local_user               = var.meshdb_local_user
  meshdb_mgr_ips                  = var.meshdb_mgr_ips
  meshdb_ips                      = var.meshdb_ips
  meshdb_lb_ip                    = var.meshdb_lb_ip
  meshdb_gateway                  = var.meshdb_gateway
  meshdb_networkrange             = var.meshdb_networkrange
  meshdb_net_block                = var.meshdb_net_block
  meshdb_external_ip              = var.meshdb_external_ip
  meshdb_fqdn                     = var.meshdb_fqdn
  meshdb_local_password           = var.meshdb_local_password
  k3s_token                       = var.k3s_token
  vm_nic                          = var.vm_nic
}