locals {
  vm_metadata = {
    "serial-port-enable" = 1
    "ssh-keys"           = "ubuntu:${var.vms_ssh_public_key}"
  }
}