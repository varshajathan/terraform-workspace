provider "google" {
  //credentials = jsondecode(base64decode(var.gcp_credentials))
  credentials = var.gcp_credentials
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-vms"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["web"]
}
