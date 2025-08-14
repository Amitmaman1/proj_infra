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
  description = "Namespace to install NGINX Ingress Controller"
  type        = string
  default     = "ingress-nginx"
}

variable "release_name" {
  description = "Helm release name"
  type        = string
  default     = "ingress-nginx"
}

variable "chart_version" {
  description = "Helm chart version"
  type        = string
  default     = "4.7.1"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the load balancer"
  type        = list(string)
}
