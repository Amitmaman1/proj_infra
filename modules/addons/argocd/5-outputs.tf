output "namespace" {
  description = "Namespace where ArgoCD is installed"
  value       = kubernetes_namespace.argocd.metadata[0].name
}

output "release_name" {
  description = "Helm release name"
  value       = helm_release.argocd.name
}

output "chart_version" {
  description = "Helm chart version"
  value       = helm_release.argocd.version
}

output "admin_password" {
  description = "Admin password for ArgoCD"
  value       = var.admin_password
  sensitive   = true
}
