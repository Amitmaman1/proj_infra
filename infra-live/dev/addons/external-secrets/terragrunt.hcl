terraform {
  source = "../../../../modules/addons/external-secrets"
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
  cluster_name      = dependency.eks.outputs.cluster_name
  cluster_endpoint  = dependency.eks.outputs.cluster_endpoint
  cluster_ca        = dependency.eks.outputs.cluster_ca
  external_role_arn = dependency.eks.outputs.openid_provider_arn

  region        = "us-east-1"
  namespace     = "external-secrets"
  release_name  = "external-secrets"
  chart_version = "0.10.6"
}
