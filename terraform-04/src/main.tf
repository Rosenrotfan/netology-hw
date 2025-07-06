resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

module "vpc_marketing" {
  source = "./vpc/marketing"
  env_name = "marketing"
}

module "vpc_analytics" {
  source = ".vpc_analytics"
  env_name = "analytics"
}