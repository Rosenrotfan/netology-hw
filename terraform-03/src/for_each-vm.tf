resource "yandex_compute_instance" "db" {
    for_each = {
        master = var.vms_resources["db_master"],
        slave  = var.vms_resources["db_slave"]
    }
    name        = each.key
    platform_id = each.value.plat
    zone        = each.value.zone
    resources {
        cores         = each.value.cores
        memory        = each.value.memory
        core_fraction = each.value.core_fraction
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
    metadata = local.vm_metadata
}