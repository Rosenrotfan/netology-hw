output "external_ips" {
  value = {
    for idx, instance in yandex_compute_instance.vm :
    instance.name => instance.network_interface.0.nat_ip_address
  }
}