terraform {
  backend "gcs" {
    bucket = "34e365ce1b04ffa2-tf-state"
    prefix = "terraform/state"
  }
}