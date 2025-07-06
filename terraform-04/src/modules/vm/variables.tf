variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    plat          = string
    zone          = string
    count         = number
  }))
  default = {
    vm = {
      count         = 1
      cores         = 2
      memory        = 2
      core_fraction = 5
      plat          = "standard-v2"
      zone          = "ru-central1-a"
    }
  }
}

variable "vm_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Тип ос"
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "project" {
  description = "Project label (marketing/analytics)"
  type        = string
}

variable "ssh_key" {
  description = "SSH public key"
  type        = string
}