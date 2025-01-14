output "frontend_url_output" {
  value = [for net in docker_container.frontend.networks_advanced : net.ipv4_address if net.name == docker_network.external.name][0]
}
