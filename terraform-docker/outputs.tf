
output "IP-Address" {
  value       = [for i in docker_container.nodered_container[*] : join(":", [i.ip_address], i.ports[*]["external"])]
  description = "Container external IP address and port"

}

output "Container-Name" {
  value       = docker_container.nodered_container[*].name
  description = "Container name"

}