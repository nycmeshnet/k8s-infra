mesh_proxmox_node             = "nycmesh-713-r640-02"
mesh_proxmox_template_image   = "debian-cloud"
mesh_proxmox_storage_location = "local-lvm"
mesh_env_name                 = "prod1"
mesh_local_user               = "debian"
vm_nic                        = "vmbr0v32"
mesh_mgr_ips = [
  "10.70.90.152",
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
  "10.70.90.153",
  "10.70.90.154",
  "10.70.90.155",
  "10.70.90.157",
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
mesh_lb_ip        = "10.70.90.156"
mesh_gateway      = "10.70.90.1"
mesh_networkrange = "24"
mesh_net_block    = "10.70.90.0"
mesh_external_ips = [
  "199.170.132.45",
]
meshdb_fqdn = [
  "wiki.nycmesh.net",
  "wiki.mesh.nycmesh.net",
  "los-backend.db.nycmesh.net",
  "mastodon.nycmesh.net",
  "gsg-displays.nycmesh.net",
]
