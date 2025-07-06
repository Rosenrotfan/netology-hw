resource "yandex_compute_disk" "disks" {
  count          = var.vms_resources_str["storage"].dcount
  name           = "disk-${count.index + 1}"
  size           = var.vms_resources_str["storage"].dsize
  type           = var.vms_resources_str["storage"].dtype
  zone           = var.vms_resources_str["storage"].zone
  folder_id      = var.folder_id
  block_size     = 4096
#  delete_with_vm = truevar.vms_resources_str["storage"].dwvm
}

resource "yandex_compute_instance" "storage" {
    name        = var.vms_resources_str["storage"].name
    platform_id = var.vms_resources_str["storage"].plat
    zone        = var.vms_resources_str["storage"].zone
    resources {
        cores         = var.vms_resources_str["storage"].cores
        memory        = var.vms_resources_str["storage"].memory
        core_fraction = var.vms_resources_str["storage"].core_fraction
    }
    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }
    scheduling_policy {
        preemptible = true
    }
    network_interface {
        subnet_id           = yandex_vpc_subnet.develop.id  
        nat                 = true
    }
    dynamic "secondary_disk" {
        for_each = yandex_compute_disk.disks
        content {
            disk_id = secondary_disk.value.id
        }
    }
    metadata = local.vm_metadata
}