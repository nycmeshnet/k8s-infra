meshdb_proxmox_node             = "nycmesh-713-r640-02"
meshdb_proxmox_template_image   = "debian-cloud"
meshdb_proxmox_storage_location = "local-lvm"
meshdb_env_name                 = "prod1"
meshdb_local_user               = "debian"
vm_nic                          = "vmbr0v32"
meshdb_mgr_ips = [
  "10.70.90.152",
]
meshdb_ips = [
  "10.70.90.153",
  "10.70.90.154",
  "10.70.90.155",
]
meshdb_lb_ip        = "10.70.90.156"
meshdb_gateway      = "10.70.90.1"
meshdb_networkrange = "24"
meshdb_net_block    = "10.70.90.0"
meshdb_external_ip  = "199.170.132.45"
meshdb_fqdn         = "db.mesh.nycmesh.net"
