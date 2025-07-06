terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
#  required_version = ">=1.8.4"
}
provider "docker" {
  host            = "tcp://0.0.0.0:2376"
  ca_material     = file("./tls/ca.crt")
  cert_material   = file("./tls/cert.pem")  
  key_material    = file("./tls/key.pem") 
}

resource "random_password" "mysql_pass" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "mysql_root_pass" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql8"
  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.mysql_root_pass.result}",
    "MYSQL_USER=test",
    "MYSQL_PASSWORD=${random_password.mysql_pass.result}",
    "MYSQL_DATABASE=test"
  ]
  ports {
    internal = 3306
    external = 3306
  }
}
