resource "proxmox_vm_qemu" "meshwkr" {
  count = length(var.mesh_ips)

  name        = "mesh${var.mesh_env_name}node${count.index}"
  desc        = "worker ${count.index} for mesh services ${var.mesh_env_name}"
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

  ipconfig0 = "ip=${var.mesh_ips[count.index]}/${var.mesh_networkrange},gw=${var.mesh_gateway}"

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

