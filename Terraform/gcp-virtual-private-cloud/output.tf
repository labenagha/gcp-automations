output "vpc_network_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.vpc_network.id
}

output "vpc_network_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.vpc_network.name
}

output "vpc_subnet_name" {
  description = "The name of the VPC subnet"
  value       = google_compute_subnetwork.vpc_subnet.name
}

output "vpc_subnet_region" {
  description = "The region of the VPC subnet"
  value       = google_compute_subnetwork.vpc_subnet.region
}

output "firewall_allow_ssh_id" {
  description = "The ID of the SSH firewall rule"
  value       = google_compute_firewall.allow_ssh.id
}

output "firewall_allow_egress_internet_id" {
  description = "The ID of the firewall rule for egress to the internet"
  value       = google_compute_firewall.allow-egress-internet.id
}
