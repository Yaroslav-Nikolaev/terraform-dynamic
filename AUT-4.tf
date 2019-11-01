
resource "google_compute_instance" "default" {
  name = "aut-4--test-instance"
  machine_type = "n1-standard-1"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      size = 10
      type = "pd-standard"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "https://www.googleapis.com/compute/v1/projects/team-saasops/global/networks/optiva-gcp-vpc"
    subnetwork = "https://www.googleapis.com/compute/v1/projects/team-saasops/regions/us-central1/subnetworks/team-saasops-us-central1-test"
    subnetwork_project = "team-saasops"
    access_config {
      // Ephemeral IP
    }
  }

  labels = {
    budget = "feature",
    cost_type = "maint",
    customer = "vmz",
    owner = "yaro",
    product = "uc",
    type = "aio",
    end_of_life = "1574899200",
    working_till = "1572643572",
    jira="aut-4"
  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro"]
  }
}
