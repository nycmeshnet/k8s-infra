mesh_proxmox_node             = "nycmesh-10-r630-01"
mesh_proxmox_template_image   = "debian-cloud"
mesh_proxmox_storage_location = "local-lvm"
mesh_env_name                 = "prod2"
mesh_local_user               = "debian"
vm_nic                        = "vmbr1"
mesh_mgr_ips = [
  "10.70.100.47",
]
mesh_mgr_cores = [
  4,
]
mesh_mgr_ram_mb = [
  6144,
]
mesh_mgr_disk_size = [
  80,
]
mesh_ips = [
  "10.70.100.48",
  "10.70.100.49",
  "10.70.100.50",
]
mesh_worker_cores = [
  4,
  4,
  4,
]
mesh_worker_ram_mb = [
  4096,
  4096,
  4096,
]
mesh_worker_disk_size = [
  150,
  150,
  150,
]
mesh_lb_ip          = "10.70.100.51"
mesh_lb_internal_ip = "10.70.100.63"
mesh_lb_cores       = 2
mesh_lb_ram_mb      = 6144
mesh_lb_disk_size   = 10
mesh_gateway        = "10.70.100.1"
mesh_networkrange   = "24"
mesh_external_ips = [
  "23.158.16.22",
]
meshdb_fqdn = [
  "sn10temp.nycmesh.net",
]

internal_apps_fqdn = [
  "jamesinternalprodtwo.mesh.nycmesh.net",
]
