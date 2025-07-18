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
  6,
]
mesh_mgr_ram_mb = [
  8192,
]
mesh_mgr_disk_size = [
  50,
]
mesh_ips = [
  "10.70.90.153",
  "10.70.90.154",
  "10.70.90.155",
  "10.70.90.157",
  "10.70.90.161",
]
mesh_worker_cores = [
  6,
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
  8192,
]
mesh_worker_disk_size = [
  150,
  150,
  150,
  150,
  150,
]
mesh_lb_ip          = "10.70.90.156"
mesh_lb_internal_ip = "10.70.90.209"
mesh_gateway        = "10.70.90.1"
mesh_networkrange   = "24"
mesh_external_ips = [
  "199.170.132.45",
]
meshdb_fqdn = [
  "wiki.nycmesh.net",
  "wiki.mesh.nycmesh.net",
  "los-backend.db.nycmesh.net",
  "adminmap.db.nycmesh.net",
  "los.nycmesh.net",
  "map.nycmesh.net",
  "forms.nycmesh.net",
  "stats.nycmesh.net",
  "db.nycmesh.net",
  "mastodon.nycmesh.net",
  "mastadon.nycmesh.net",
  "social.nycmesh.net",
  "mastodon.mesh.nycmesh.net",
  "gsg-displays.nycmesh.net",
  "nyckml.mesh.nycmesh.net",
]

internal_apps_fqdn = [
  "building.mesh.nycmesh.net",
  "airflow.mesh.nycmesh.net",
]
