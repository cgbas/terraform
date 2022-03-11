terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.16.0"
    }
  }
}

provider "docker" {}

resource "null_resource" "docker_volume" {
  provisioner "local-exec" {
    command = "mkdir noderedvol || true && sudo chown 1000:1000 noderedvol"
  }
}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"

}

resource "random_string" "random" {
  count   = var.container_count
  length  = 4
  upper   = false
  special = false
}

resource "random_integer" "random_port" {
  count = var.container_count
  min   = 0
  max   = 65535
}

resource "docker_container" "nodered_container" {
  count = var.container_count
  name  = join("-", ["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal = var.int_port
    external = random_integer.random_port[count.index].result
  }
  volumes {
    host_path = var.docker_host_path
    container_path = "/data"
  }
}
