variable "mesh_proxmox_node" {
  type        = string
  description = "target node on the proxmox server"
}

variable "mesh_proxmox_template_image" {
  type        = string
  description = "name of the template you have already setup in proxmox"
  default     = "debian-cloud"
}

variable "mesh_proxmox_storage_location" {
  type        = string
  description = "target resource pool on the proxmox server"
  default     = "local-lvm"
}

variable "mesh_env_name" {
  type        = string
  description = "name of the environment(dev0, dev1, stage, prod)"
}

variable "mesh_local_user" {
  type        = string
  description = "local user username"
  default     = "debian"
}

variable "mesh_local_password" {
  type        = string
  description = "password for the local user"
  sensitive   = true
}

variable "longhorn_passphrase" {
  type        = string
  description = "password encrypted volumes in longhorn"
  sensitive   = true
}

variable "mesh_mgr_ips" {
  description = "static IPs to use for managers"
}

variable "mesh_ips" {
  description = "static IPs to use for workers"
}

variable "mesh_lb_ip" {
  description = "static IP to use for k8s lb"
}

variable "mesh_gateway" {
  description = "default gateway to use for nodes"
  default     = "10.70.90.1"
}

variable "mesh_networkrange" {
  description = "network range to use for nodes"
  default     = "24"
}

variable "mesh_external_ips" {
  type        = list(string)
  description = "external ip for meshdb, assigned to the lb vm"
}

variable "meshdb_fqdn" {
  type        = list(string)
  description = "FQDNs the cluster should respond to"
}

variable "vm_nic" {
  type        = string
  description = "nic for the vms"
  default     = "vmbr0"
}

variable "k3s_token" {
  type        = string
  description = "token for the k3s cluster"
  sensitive   = true
}

variable "DATADOG_API_KEY" {
  type        = string
  description = "datadog API key"
  sensitive   = true
}

variable "DATADOG_SITE" {
  type        = string
  description = "datadog site url"
  sensitive   = true
}

variable "mesh_mgr_cores" {
  type        = list(number)
  description = "list of core counts for the manager nodes"
}

variable "mesh_mgr_ram_mb" {
  type        = list(number)
  description = "list of ram sizes for the manager nodes"
}

variable "mesh_mgr_disk_size" {
  type        = list(number)
  description = "list of disk sizes for the manager nodes"
}

variable "mesh_worker_cores" {
  type        = list(number)
  description = "list of core counts for the worker nodes"
}

variable "mesh_worker_ram_mb" {
  type        = list(number)
  description = "list of ram sizes for the worker nodes"
}

variable "mesh_worker_disk_size" {
  type        = list(number)
  description = "list of disk sizes for worker node"
}

variable "mesh_lb_cores" {
  type        = number
  description = "number of cores for the lb"
  default     = 2
}

variable "mesh_lb_ram_mb" {
  type        = number
  description = "ram size for the lb in mb"
  default     = 2560
}

variable "mesh_lb_disk_size" {
  type        = number
  description = "disk size for the lb in gb"
  default     = 10
}

variable "bird_network" {
  type        = string
  description = "bird ospf network for the lb vm"
  default     = "10.69.0.0/16"
}

variable "bird_neighbor" {
  type        = string
  description = "bird ospf neighbor for the lb vm"
}

variable "bird_ospf_cost" {
  type        = string
  description = "OSPF cost for only bird"
  default     = "10"
}
