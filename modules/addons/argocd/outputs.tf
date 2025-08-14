output "argocd_namespace" {
  description = "Namespace where ArgoCD is installed"
  value       = kubernetes_namespace.argocd.metadata[0].name
}

output "argocd_release_name" {
  description = "Name of the ArgoCD release"
  value       = helm_release.argocd.name
}

output "argocd_version" {
  description = "Version of ArgoCD deployed"
  value       = helm_release.argocd.version
}

output "argocd_status" {
  description = "Status of the ArgoCD deployment"
  value       = helm_release.argocd.status
}