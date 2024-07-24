resource "proxmox_vm_qemu" "meshmgr" {
  count = 1

  name        = "mesh${var.mesh_env_name}mgr${count.index}"
  desc        = "managment server for mesh services ${var.mesh_env_name}"
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
          size    = 50
          storage = var.mesh_proxmox_storage_location

        }
      }
    }
  }

  network {
    bridge = var.vm_nic
    model  = "virtio"
  }

  ipconfig0 = "ip=${var.mesh_mgr_ips[0]}/${var.mesh_networkrange},gw=${var.mesh_gateway}"

  ssh_user        = "root"
  ssh_private_key = file("${path.module}/mesh${var.mesh_env_name}")

  sshkeys = file("${path.module}/mesh${var.mesh_env_name}.pub")

  serial {
    id   = 0
    type = "socket"
  }

  tags = "mesh${var.mesh_env_name}"

  lifecycle {
    ignore_changes = [
      qemu_os,
    ]
  }
}
