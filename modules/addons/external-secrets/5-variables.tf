variable "cluster_name" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}

variable "cluster_ca" {
  type = string
}

variable "external_role_arn" {
  type = string
  description = "IAM role for IRSA (External Secrets Operator)"
}

variable "region" {
  type = string
}

variable "namespace" {
  type    = string
  default = "external-secrets"
}

variable "release_name" {
  type    = string
  default = "external-secrets"
}

variable "chart_version" {
  type    = string
  default = "0.10.6"
}