module "shared_provider" {
  source = "../shared-provider"
}

resource "google_compute_instance" "ubuntu_instance" {
  name                    = "gke-server1"
  machine_type            = "n1-standard-1"
  zone                    = module.shared_provider.gcp_region
  tags                    = ["ssh-allowed"]
  metadata_startup_script = "echo hi > /test.txt"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.subnet.name
    access_config {
    }
  }
}