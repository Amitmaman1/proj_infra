terraform {
  source = "../../../../modules/addons/aws-load-balancer-controller"
}

include "env" {
  path           = "../../env.hcl"
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  cluster_name     = dependency.eks.outputs.cluster_name
  cluster_endpoint = dependency.eks.outputs.cluster_endpoint
  cluster_ca       = dependency.eks.outputs.cluster_ca
  aws_region       = "us-east-1"
  namespace        = "kube-system"
  release_name     = "aws-load-balancer-controller"
  chart_version    = "1.6.1"
  vpc_id           = dependency.vpc.outputs.vpc_id
}

dependency "eks" {
  config_path = "../../eks"
}

dependency "vpc" {
  config_path = "../../vpc"
}
