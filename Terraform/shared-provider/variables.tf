variable "project_id" {
  description = "The ID of the Google Cloud project where resources will be created."
  type        = string
  default     = "gke-demo-anthos-project"
}

variable "region" {
  description = "The region where GCP resources will be created (e.g., us-central1, europe-west1)."
  type        = string
  default     = "us-south1"
}
