resource "google_compute_network" "vpc_network" {
  name                    = format("%s", "${var.env}-vpc")
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags = ["http"]
}

resource "google_compute_subnetwork" "public" {
  name          = "${google_compute_network.vpc_network.name}-public"
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.0.1.0/24"
}

resource "google_compute_subnetwork" "private" {
  name                     = "${google_compute_network.vpc_network.name}-private"
  region                   = var.gcp_region
  private_ip_google_access = true
  network                  = google_compute_network.vpc_network.name
  ip_cidr_range            = "10.0.2.0/24"
}
