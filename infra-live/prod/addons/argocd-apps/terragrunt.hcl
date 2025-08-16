terraform {
  source = "../../../../modules/addons/argocd-apps"
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
  environment      = "prod"
  app_repo_url        = "https://github.com/amitmaman/gitops"
  app_target_revision = "main"
  app_path           = "helm-charts/my-app"
}
