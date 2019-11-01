// Configure the Google Cloud provider
provider "google" {
  project     = "team-saasops"
  region      = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "jira-demo"
    prefix = "demo"
  }
}
