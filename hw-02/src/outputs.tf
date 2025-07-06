output "instances_info" {
  value = {
    for k, inst in {
      "web": yandex_compute_instance.platform_web,
      "db":  yandex_compute_instance.platform_db
    } : k => {
      instance_name = inst.name
      external_ip   = inst.network_interface.0.nat_ip_address
      fqdn          = inst.fqdn
    }
  }
  description = "Информация о каждой виртуальной машине: имя, IP адрес и FQDN."
}