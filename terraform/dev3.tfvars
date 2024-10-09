mesh_proxmox_node             = "jon"
mesh_proxmox_template_image   = "debian-cloud"
mesh_proxmox_storage_location = "local-lvm"
mesh_env_name                 = "dev3"
mesh_local_user               = "debian"
mesh_mgr_ips = [
  "10.70.90.146",
]
mesh_mgr_cores = [
  4,
]
mesh_mgr_ram_mb = [
  4096,
]
mesh_mgr_disk_size = [
  50,
]
mesh_ips = [
  "10.70.90.147",
  "10.70.90.143",
  "10.70.90.144",
  "10.70.90.149",
]
mesh_worker_cores = [
  4,
  4,
  4,
  4,
]
mesh_worker_ram_mb = [
  4096,
  4096,
  4096,
  4096,
]
mesh_worker_disk_size = [
  150,
  150,
  150,
  150,
]
mesh_lb_ip        = "10.70.90.145"
mesh_gateway      = "10.70.90.1"
mesh_networkrange = "24"
mesh_net_block    = "10.70.90.0"
mesh_external_ip  = "199.170.132.46"
# Add domains to the end
meshdb_fqdn = "devdb.nycmesh.net,map.devdb.nycmesh.net,adminmap.devdb.nycmesh.net,los-backend.devdb.nycmesh.net,los.devdb.nycmesh.net,forms.devdb.nycmesh.net"
