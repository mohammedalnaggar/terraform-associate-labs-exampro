# resource "google_service_account" "default" {
#   account_id   = "service_account_id"
#   display_name = "Service Account"
# }

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-medium"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

  }

}