

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.21.0"
    }
  }
}


provider "google" {
  project     = "naggar-test-01"
  region      = "us-central1"
  zone = "us-central1-a"
  credentials = "/Users/mohammedalnaggar/Downloads/naggar-test-01-2cdd991faca5.json"
}