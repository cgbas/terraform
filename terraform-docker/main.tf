

provider "docker" {}

resource "null_resource" "docker_volume" {
  provisioner "local-exec" {
    command = "mkdir noderedvol || true && sudo chown 1000:1000 noderedvol"
  }
}

module "image" {
  source = "./image"
  image_in = var.image[terraform.workspace]
}

module "container" {
  source = "./container"
  depends_on = [null_resource.docker_volume]
  count = var.container_count
  name_in = join("-", ["nodered", random_string.random[count.index].result])
  image_in = module.image.image_out
  int_port_in = var.int_port
  ext_port_in = var.ext_port
  container_path_in = "/data"
  host_path_in = ""${path.cwd}/noderedvol"

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

