variable "meshdb_proxmox_host" {
  type        = string
  description = "ip/domain of the proxmox server"
}

variable "meshdb_proxmox_token_id" {
  type        = string
  description = "proxmox server token id"
}

variable "meshdb_proxmox_token_secret" {
  type        = string
  description = "proxmox server token secret"
  sensitive   = true
}

variable "meshdb_prod_proxmox_host" {
  type        = string
  description = "ip/domain of the proxmox server"
}

variable "meshdb_prod_proxmox_token_id" {
  type        = string
  description = "proxmox server token id"
}

variable "meshdb_prod_proxmox_token_secret" {
  type        = string
  description = "proxmox server token secret"
  sensitive   = true
}

variable "meshdb_local_password" {
  type        = string
  description = "password for the local user"
  sensitive   = true
}

variable "k3s_token" {
  type        = string
  description = "token for the k3s cluster"
  sensitive   = true
}
