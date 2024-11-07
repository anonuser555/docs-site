provider "helm" {
  kubernetes {}
}


locals {
  values_file 	     = file("${path.module}/mcm-docs-site/values.yaml")
}


resource "helm_release" "mcm-docs-site-deployment" {
  name       = "mcm-docs-site-deployment"
  namespace     = var.target_namespace
  chart      = "./mcm-docs-site" 
  create_namespace = true
  values = [local.values_file]
  dependency_update = true
}
