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
resource "docker_container" "nodered_container" {
  name  = "nodered"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }

}

output "IP-Address" {
  value =  docker_container.nodered_container.ip_address
  description = "Container internal IP address"
  
}
output "Container-Name" {
  value = docker_container.nodered_container.name
  description = "Container name"
}