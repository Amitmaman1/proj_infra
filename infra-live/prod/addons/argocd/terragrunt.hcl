terraform {
  source = "../../../../modules/addons/argocd"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "env" {
  path           = "../../env.hcl"
  expose         = true
  merge_strategy = "no_merge"
}

dependency "eks" {
  config_path = "../../eks"
}

inputs = {
  cluster_name     = dependency.eks.outputs.cluster_name
  cluster_endpoint = dependency.eks.outputs.cluster_endpoint
  cluster_ca       = dependency.eks.outputs.cluster_ca
  namespace        = "argocd"
  release_name     = "argocd"
  chart_version    = "5.51.6"
  admin_password   = "admin123"
}
