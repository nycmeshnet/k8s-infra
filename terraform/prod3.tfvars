mesh_proxmox_node             = "nycmesh-11-r640-02"
mesh_proxmox_template_image   = "debian-cloud"
mesh_proxmox_storage_location = "local-lvm"
mesh_env_name                 = "prod3"
mesh_local_user               = "debian"
vm_nic                        = "vmbr1"
mesh_mgr_ips = [
  "10.70.100.30",
]
mesh_mgr_cores = [
  6,
]
mesh_mgr_ram_mb = [
  8192,
]
mesh_mgr_disk_size = [
  50,
]
mesh_ips = [
  "10.70.100.31",
  "10.70.100.32",
  "10.70.100.33",
  "10.70.100.34",
]
mesh_worker_cores = [
  6,
  6,
  6,
  6,
]
mesh_worker_ram_mb = [
  8192,
  8192,
  8192,
  8192,
]
mesh_worker_disk_size = [
  250,
  250,
  250,
  250,
]
mesh_lb_ip          = "10.70.100.39"
mesh_lb_internal_ip = "10.70.100.38"
mesh_gateway        = "10.70.100.1"
mesh_networkrange   = "24"
mesh_external_ips = [
  "23.158.16.20",
]
meshdb_fqdn = [
  "pano.nycmesh.net",
  "img.nycmesh.net",
]

internal_apps_fqdn = [
]
