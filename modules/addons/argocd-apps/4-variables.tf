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

variable "environment" {
  description = "Environment (dev or prod)"
  type        = string
}

variable "app_repo_url" {
  description = "Git repository URL for the application"
  type        = string
  default     = "https://github.com/your-org/your-app-repo"
}

variable "app_target_revision" {
  description = "Git branch or tag to deploy"
  type        = string
  default     = "main"
}

variable "app_path" {
  description = "Path to the application in the repository"
  type        = string
  default     = "."
}
