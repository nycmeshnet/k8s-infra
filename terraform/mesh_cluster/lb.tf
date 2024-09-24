resource "proxmox_vm_qemu" "k8s-lb" {
  name        = "k8s-lb-${var.mesh_env_name}"
  desc        = "router and lb for k8s"
  target_node = var.mesh_proxmox_node

  clone = var.mesh_proxmox_template_image

  cores                   = 2
  sockets                 = 1
  memory                  = 2560
  os_type                 = "cloud-init"
  agent                   = 1
  cloudinit_cdrom_storage = var.mesh_proxmox_storage_location
  ciuser                  = var.mesh_local_user
  cipassword              = var.mesh_local_password

  scsihw = "virtio-scsi-pci"

  disks {
    scsi {
      scsi0 {
        disk {
          backup  = false
          size    = 10
          storage = var.mesh_proxmox_storage_location

        }
      }
    }
  }

  network {
    bridge = var.vm_nic
    model  = "virtio"
  }

  ipconfig0 = "ip=${var.mesh_lb_ip}/${var.mesh_networkrange},gw=${var.mesh_gateway}"

  ssh_user        = "root"
  ssh_private_key = file("${path.module}/mesh${var.mesh_env_name}")

  sshkeys = file("${path.module}/mesh${var.mesh_env_name}.pub")

  serial {
    id   = 0
    type = "socket"
  }

  tags = "mesh${var.mesh_env_name};managed_by_iac"

  lifecycle {
    ignore_changes = [
      qemu_os,
    ]
  }
}

