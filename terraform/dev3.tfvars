mesh_proxmox_node             = "nycmesh-713-r640-02"
mesh_proxmox_template_image   = "debian-cloud"
mesh_proxmox_storage_location = "local-lvm"
mesh_env_name                 = "dev3"
mesh_local_user               = "debian"
vm_nic                        = "vmbr0v32"
mesh_mgr_ips = [
  "10.70.90.146",
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
  "10.70.90.147",
  "10.70.90.143",
  "10.70.90.144",
]
mesh_worker_cores = [
  6,
  6,
  6,
]
mesh_worker_ram_mb = [
  8192,
  8192,
  8192,
]
mesh_worker_disk_size = [
  250,
  250,
  250,
]
mesh_lb_ip          = "10.70.90.145"
mesh_lb_internal_ip = "10.70.90.210"
mesh_gateway        = "10.70.90.1"
mesh_networkrange   = "24"
mesh_external_ips = [
  "199.170.132.46",
]
meshdb_fqdn = [
  "devwiki.mesh.nycmesh.net",
  "devdb.nycmesh.net",
  "adminmap.devdb.nycmesh.net",
  "los-backend.devdb.nycmesh.net",
  "los.devdb.nycmesh.net",
  "forms.devdb.nycmesh.net",
  "devmap.nycmesh.net",
  "nyckmldev.mesh.nycmesh.net",
  "devpano.nycmesh.net",
]

internal_apps_fqdn = [
  "building-dev.mesh.nycmesh.net",
]
