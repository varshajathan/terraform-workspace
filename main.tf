
provider "google" {
  project     = "gcp-labs-2024"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "n2-standard-2"
  zone        = "us-central1-c"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

    provisioner "local-exec" {
    command = "gcloud compute instances create my-instance-2 --zone us-central1-c"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}
