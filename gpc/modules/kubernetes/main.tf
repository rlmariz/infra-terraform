# Google Kubernetes Engine (GKE)

resource "google_container_cluster" "primary" {
  name     = "services-gke-cluster"
  location = var.gcp_region

  node_locations = [
    "${var.gcp_region}-a"
  ]

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.vpc_network_name
  subnetwork               = var.vpc_network_subnet_name
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "services-gke-cluster-node-pool"
  location   = var.gcp_region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    preemptible  = true
    machine_type = "e2-medium"


    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
