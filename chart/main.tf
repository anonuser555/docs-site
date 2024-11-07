terraform {
  backend "kubernetes" {
    secret_suffix    = "mcm-docs-site-state"
  }

 required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
}
}
