# Randon Name
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

# Create a GCS Bucket
resource "google_storage_bucket" "tf_bucket" {
  project       = var.gcp_project
  name          = "${random_id.bucket_prefix.hex}-${var.bucket_tf_state_name}"
  location      = var.gcp_region
  force_destroy = true
  storage_class = var.bucket_tf_state_storage_class
  versioning {
    enabled = true
  }
}