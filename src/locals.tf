locals {
  vmone = "${var.vm_name}-${var.vm_web_name}"
  vmtwo = "${var.vm_name}-${var.vm_db_name}"
}

locals {
  vm_metadata = {
    "serial-port-enable" = 1
    "ssh-keys"           = "ubuntu:${var.vms_ssh_public_root_key}"
  }
}