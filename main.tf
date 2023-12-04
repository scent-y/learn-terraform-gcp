terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "4.51.0"
        }
    }
}

provider "google" {
    credentials = file(var.credentials_file)
    project = var.project
    region = var.region
    zone = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
    name = "terraform-instance"
    machine_type = "f1-micro"
    tags = ["web","dev"] // ネットワークタグ

    boot_disk {
      initialize_params {
        image = "cos-cloud/cos-stable"
      }
    }

    network_interface {
      network = google_compute_network.vpc_network.name // これにより2つのリソース間の依存関係が確立される
      access_config {
      }
    }
  
}