# Собираем информацию о виртуальных машинах
locals {
  all_vms_details = {
    for inst in concat(yandex_compute_instance.web,
                       values(yandex_compute_instance.db),
                       [yandex_compute_instance.storage]):
    inst.name => {
      ip_address = inst.network_interface.0.nat_ip_address,
      fqdn       = inst.fqdn
    }
  }
}

# Группируем виртуальные машины по типам
locals {
  grouped_vms = {
    web = [
      for k, v in local.all_vms_details : {
        name       = k,
        ip_address = v.ip_address,
        fqdn       = v.fqdn
      } if startswith(k, "web")
    ],
    db = [
      for k, v in local.all_vms_details : {
        name       = k,
        ip_address = v.ip_address,
        fqdn       = v.fqdn
      } if contains(["master", "slave"], k)  # Или startswith(k, "db") если переименуете
    ],
    storage = [
      for k, v in local.all_vms_details : {
        name       = k,
        ip_address = v.ip_address,
        fqdn       = v.fqdn
      } if startswith(k, "storage")
    ]
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.ini"
  content = templatefile("${path.module}/inventory.tftpl", {
    web = local.grouped_vms.web,
    db = local.grouped_vms.db,
    storage = local.grouped_vms.storage
  })
}