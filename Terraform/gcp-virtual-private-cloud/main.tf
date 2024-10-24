module "shared_provider" {
  source = "../shared-provider"
}


resource "google_compute_network" "vpc_network" {
  name    = var.network_name
  project = "gke-demo-anthos-project"
  # Set to true if you want Google Cloud to create subnetworks automatically
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnet" {
  project       = "gke-demo-anthos-project"
  name          = var.subnet_name
  ip_cidr_range = var.subnet_ip_range
  region        = module.shared_provider.gcp_region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "allow_internal" {
  project = "gke-demo-anthos-project"
  name    = "allow-internal"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = ["10.0.0.0/24"]
}

resource "google_compute_firewall" "allow_ssh" {
  project       = "gke-demo-anthos-project"
  name          = "allow-ssh"
  source_ranges = ["0.0.0.0/0"]
  network       = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["ssh-allowed"]
}

resource "google_compute_firewall" "allow-egress-internet" {
  name      = "allow-egress-internet"
  network   = google_compute_network.vpc_network.name
  direction = "EGRESS"
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  destination_ranges = ["0.0.0.0/0"]
}