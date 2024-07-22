variable "meshdb_proxmox_node" {
  type        = string
  description = "target node on the proxmox server"
}

variable "meshdb_proxmox_template_image" {
  type        = string
  description = "name of the template you have already setup in proxmox"
  default     = "debian-cloud"
}

variable "meshdb_proxmox_storage_location" {
  type        = string
  description = "target resource pool on the proxmox server"
  default     = "local-lvm"
}

variable "meshdb_env_name" {
  type        = string
  description = "name of the environment(dev0, dev1, stage, prod)"
}

variable "meshdb_local_user" {
  type        = string
  description = "local user username"
  default     = "debian"
}

variable "meshdb_local_password" {
  type        = string
  description = "password for the local user"
  sensitive   = true
}

variable "meshdb_mgr_ips" {
  description = "static IPs to use for managers"
}

variable "meshdb_ips" {
  description = "static IPs to use for nodes"
}

variable "meshdb_lb_ip" {
  description = "static IP to use for k8s lb"
}

variable "meshdb_gateway" {
  description = "default gateway to use for nodes"
  default     = "10.70.90.1"
}

variable "meshdb_networkrange" {
  description = "network range to use for nodes"
  default     = "24"
}

variable "meshdb_net_block" {
  description = "network range to use for intneral networking"
  default     = "10.70.90.0"
}

variable "meshdb_external_ip" {
  type        = string
  description = "external ip for meshdb, assigned to the lb vm"
}

variable "meshdb_fqdn" {
  type        = string
  description = "fqdn meshdb should be responding to"
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
