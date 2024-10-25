terraform {
  backend "gcs" {
    bucket = "terraform-state-gke-bucket"
    prefix = "terraform/state/gke-sharedstate.demo"
  }
}