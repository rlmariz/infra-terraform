variable "gcp_project" {
  type        = string
  description = "GCP project name"
}

# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "vpc_network_name" {
  type        = string
  description = "Network vpc name"
}

variable "vpc_network_subnet_name" {
  type        = string
  description = "Subnet name"
}