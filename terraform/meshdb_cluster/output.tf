output "mgr_ip" {
  description = "IP address of the managment node"
  value = {
    for k, mgr in proxmox_vm_qemu.meshdbmgr : k => mgr.default_ipv4_address
  }
}

output "worker_ips" {
  description = "IP address of the worker node"
  value = {
    for k, node in proxmox_vm_qemu.meshdbnode : k => node.default_ipv4_address
  }
}

output "lb_ip" {
  description = "IP address of the lb"
  value = {
    "0" = var.meshdb_lb_ip
  }
}

#resource "local_file" "kubeconfig" {
#  content  = module.k3s.kube_config
#  filename = "${path.module}/k3s.${var.meshdb_env_name}.yaml"
#}
