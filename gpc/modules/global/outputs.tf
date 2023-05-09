output "vpc_self_link" {
  value = google_compute_network.vpc_network
}

output "vpc_network_name" {
  value = google_compute_network.vpc_network.name
}

output "vpc_network_subnet_private_name" {
  value = google_compute_subnetwork.private.name
}

output "vpc_network_subnet_public_name" {
  value = google_compute_subnetwork.public.name
}
