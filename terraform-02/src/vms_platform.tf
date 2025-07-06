###os type

variable "vm_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Тип ос"
}

variable "vm_name" {
  type        = string
  default     = "netology-develop-platform"
  description = "Общее имя вм"
}

###vm web vars

variable "vm_web_name" {
  type        = string
  default     = "web"
  description = "Имя вм"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Платформа процессора"
}

variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона доступности"
}

#variable "vm_web_cores" {
#  type        = number
#  default     = "2"
#  description = "Колличество ядер"
#}

#variable "vm_web_memory" {
#  type        = number
#  default     = "2"
#  description = "Колличество ram"
#}

#variable "vm_web_core_fraction" {
#  type        = number
#  default     = "5"
#  description = "Гарантированная доля vCPU %"
#}

variable "vm_web_vpc_name" {
  type        = string
  default     = "web"
  description = "Зона доступности"
}

variable "vm_web_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

###vm web vars

variable "vm_db_name" {
  type        = string
  default     = "db"
  description = "Имя вм"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Платформа процессора"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Зона доступности"
}

#variable "vm_db_cores" {
#  type        = number
#  default     = "2"
#  description = "Колличество ядер"
#}

#variable "vm_db_memory" {
#  type        = number
#  default     = "2"
#  description = "Колличество ram"
#}

#variable "vm_db_core_fraction" {
#  type        = number
#  default     = "20"
#  description = "Гарантированная доля vCPU %"
#}

variable "vm_db_vpc_name" {
  type        = string
  default     = "db"
  description = "Зона доступности"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))

  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 5
    },
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}