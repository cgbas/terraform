terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.12"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "random_string" "random" {
  count   = 2
  length  = 4
  special = false
  upper   = false
}

# resource "docker_container" "nodered_container" {

#   image = docker_image.nodered_image.latest
#   name  = join("-", ["nodered", random_string.random[0].result])
#   ports {
#     internal = 1880
#     #external = 1880
#   }
# }

