terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.16.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"

}

resource "random_string" "random" {
  count = 2
  length  = 4
  upper   = false
  special = false
}


resource "docker_container" "nodered_container" {
  count = 2
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
  # external = 1880
  }

}

output "IP-Address" {
  value       = [for i in docker_container.nodered_container[*]: join(":", [i.ip_address], i.ports[*]["external"])]
  description = "Container external IP address and port"

}

output "Container-Name" {
  value       = docker_container.nodered_container[*].name
  description = "Container name"

}