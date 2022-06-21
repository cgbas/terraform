output "container_ip_address" {
    value = docker_container.nodered_container.ip_address
    description = "The IP Address of the container"
}