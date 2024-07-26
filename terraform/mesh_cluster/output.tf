output "mgr_ip" {
  description = "IP address of the managment node"
  value = {
    for k, mgr in proxmox_vm_qemu.meshmgr : k => mgr.default_ipv4_address
  }
}

output "worker_ips" {
  description = "IP address of the worker node"
  value = {
    for k, node in proxmox_vm_qemu.meshworker : k => node.default_ipv4_address
  }
}

output "lb_ip" {
  description = "IP address of the lb"
  value = {
    "0" = var.mesh_lb_ip
  }
}
