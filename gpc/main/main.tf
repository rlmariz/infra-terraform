module "vpc_network" {
  source     = "../modules/global"
  env        = var.env
  gcp_region = var.gcp_region
}

module "tf_bucket" {
  source                        = "../modules/bucket-backend"
  bucket_tf_state_name          = var.bucket_tf_state_name
  bucket_tf_state_storage_class = var.bucket_tf_state_storage_class
  gcp_project                   = var.gcp_project
  gcp_region                    = var.gcp_region
}

module "Kubernetes" {
  source                  = "../modules/Kubernetes"
  gcp_project             = var.gcp_project
  gcp_region              = var.gcp_region
  vpc_network_name        = module.vpc_network.vpc_network_name
  vpc_network_subnet_name = module.vpc_network.vpc_network_subnet_public_name
}

