data "yandex_compute_image" "ubuntu" {
  family = var.vm_os_family
}

data "template_file" "cloud_init" {
  template = file("${path.module}/templates/cloud-init.yml.tpl")
  vars = {
    ssh_keys = var.ssh_key
  }
}

resource "yandex_compute_instance" "vm" {
  count       = var.vms_resources["vm"].count
  name        = "${var.project}-vm-${count.index + 1}"
  platform_id = var.vms_resources["vm"].plat
  zone        = var.vms_resources["vm"].zone
  
  labels = {
    project = var.project
  }

  resources {
    cores         = var.vms_resources["vm"].cores
    memory        = var.vms_resources["vm"].memory
    core_fraction = var.vms_resources["vm"].core_fraction
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
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = data.template_file.cloud_init.rendered
  }
}