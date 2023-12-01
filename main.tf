terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "4.51.0"
        }
    }
}

provider "google" {
    credentials = file("/learn-terraform-gcp/sa.json")
    project = "{project_id}"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}