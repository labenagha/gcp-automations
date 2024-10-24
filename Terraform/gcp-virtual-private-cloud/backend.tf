terraform {
  backend "gcs" {
    bucket  = "terraform-state-gke-bucket"
    prefix  = "terraform/state/gke-sharedstate.demo"
    # project = "gke-demo-anthos-project"
    # region  = "us-south1"
  }
}