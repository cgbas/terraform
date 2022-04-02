resource "docker_container" "nodered_container" {
  image = var.image_in
  name = var.name_in
  ports {
    internal = var.int_port_in
    external = var.ext_port_in
  }
  volumes {
    container_path = var.container_path_in
    volume_in = "${var.name-in}-volume"
  }
}

resource "docker_volume" "container_volume" {
  name = "${docker_container.nodered_container.name}-volume"
}
