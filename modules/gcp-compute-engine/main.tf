terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

resource "google_compute_instance" "this" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  # Using default network interface inferred from the subnetwork
  network_interface {
    access_config {
      network_tier = var.network_tier
    }
  }

  boot_disk {
    auto_delete = true

    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }
  }

  tags = var.tags

}

