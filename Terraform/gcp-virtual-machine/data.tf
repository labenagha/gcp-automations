data "google_compute_subnetwork" "subnet" {
  name   = "gke-subnet1"
  region = module.shared_provider.gcp_region
}