output "gcp_region" {
  description = "The region where GCP resources are being created."
  value       = var.region
}


output "project_id" {
  description = "The Project ID where GCP resources are being created to."
  value       = var.project_id
}
