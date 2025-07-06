variable "network_name" {
  description = "Имя сети"
  type        = string
}

variable "zone" {
  description = "Зона доступности"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "CIDR block"
  type        = list(string)
}