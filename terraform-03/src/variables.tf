###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "security_group_id" {
  type        = string
  description = "https://terraform-provider.yandexcloud.net/resources/compute_instance"
}

variable "vm_os_family" {
  type        = string
  description = "Тип ос"
}

#vmweb res

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    plat          = string
    zone          = string
  }))
  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 5
      plat          = "standard-v2"
      zone          = "ru-central1-a"
    },
    db_master = {
      cores         = 2
      memory        = 4
      core_fraction = 5
      plat          = "standard-v2"
      zone          = "ru-central1-a"
    },
    db_slave = {
      cores         = 2
      memory        = 2
      core_fraction = 5
      plat          = "standard-v2"
      zone          = "ru-central1-a"
    }
  }
}

variable "vms_resources_str" {
  type = map(object({
    name          = string
    cores         = number
    memory        = number
    core_fraction = number
    plat          = string
    zone          = string
    dtype         = string
    dsize         = number
    dwvm          = bool
    dcount        = number
  }))
  default = {
    storage = {
      name          = "storage"
      cores         = 2
      memory        = 2
      core_fraction = 5
      plat          = "standard-v2"
      zone          = "ru-central1-a"
      dtype         = "network-hdd"
      dcount        = 3
      dsize         = 1
      dwvm          = false
    }
  }
}

variable "vms_ssh_public_key" {
  type        = string
  sensitive   = true
  description = "Открыйтый ключ"
}