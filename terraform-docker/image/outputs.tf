output "image_out" {
  value       = docker_image.nodered_image.latest
  description = "Container external IP address and port"

}