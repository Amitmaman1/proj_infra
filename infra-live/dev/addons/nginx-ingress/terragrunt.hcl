terraform {
  source = "../../../../modules/addons/nginx-ingress"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

dependency "eks" {
  config_path = "../../eks"
}

dependency "vpc" {
  config_path = "../../vpc"
}

inputs = {
  cluster_name     = dependency.eks.outputs.cluster_name
  cluster_endpoint = dependency.eks.outputs.cluster_endpoint
  cluster_ca       = dependency.eks.outputs.cluster_ca
  subnet_ids       = dependency.vpc.outputs.public_subnet_ids

  namespace     = "ingress-nginx"
  release_name  = "ingress-nginx"
  chart_version = "4.7.1"
}
