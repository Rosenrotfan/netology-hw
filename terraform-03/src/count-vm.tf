resource "yandex_compute_instance" "web" {
    count       = 2
    name        = "web-${count.index + 1}"
    platform_id = var.vms_resources["web"].plat
    zone        = var.vms_resources["web"].zone
    resources {
        cores         = var.vms_resources["web"].cores
        memory        = var.vms_resources["web"].memory
        core_fraction = var.vms_resources["web"].core_fraction
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
        security_group_ids  = [var.security_group_id]
    }

    metadata = local.vm_metadata

}
