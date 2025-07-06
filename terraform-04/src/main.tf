#Задание с вм
#resource "yandex_vpc_network" "develop" {
#  name = var.vpc_name
#}

#resource "yandex_vpc_subnet" "develop" {
#  name           = var.vpc_name
#  zone           = var.default_zone
#  network_id     = yandex_vpc_network.develop.id
#  v4_cidr_blocks = var.default_cidr
#}

#Задание с вм
module "marketing_vm" {
  source     = "./modules/vm"
  vm_name    = "marketing-vm"
  project    = "marketing"
  ssh_key  = var.ssh_key
  subnet_id  = module.vpc_dev.subnet.id
}

module "analytics_vm" {
  source     = "./modules/vm"
  vm_name    = "analytics-vm"
  project    = "analytics"
  ssh_key   = var.ssh_key
  subnet_id  = module.vpc_dev.subnet.id
}

#Задание с сетями
module "vpc_dev" {
  source        = "./modules/vpc"
  network_name  = var.vpc_name
  zone          = var.default_zone
  v4_cidr_blocks = var.default_cidr
}