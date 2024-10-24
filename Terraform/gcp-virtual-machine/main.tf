module "shared_provider" {
  source = "../shared-provider"
}

resource "google_compute_instance" "ubuntu_instance" {
  name                    = "gke-server1"
  machine_type            = "n1-standard-1"
  zone                    = "us-east1-a"
  tags                    = ["ssh-allowed"]

  metadata_startup_script = <<-EOT
    #!/bin/bash
    set -x
    PUBLIC_IP=$(curl -s http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip -H "Metadata-Flavor: Google")
    echo "The VM's public IP is: $PUBLIC_IP" > /public_ip.txt
  EOT

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