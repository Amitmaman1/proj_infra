variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_endpoint" {
  description = "Endpoint for EKS cluster"
  type        = string
}

variable "cluster_ca" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  type        = string
}

variable "namespace" {
  description = "Namespace to install AWS Load Balancer Controller"
  type        = string
  default     = "kube-system"
}

variable "release_name" {
  description = "Helm release name"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "chart_version" {
  description = "Helm chart version"
  type        = string
  default     = "1.6.1"
}

variable "aws_region" {
  description = "AWS region where the cluster is deployed"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the cluster is deployed"
  type        = string
}
