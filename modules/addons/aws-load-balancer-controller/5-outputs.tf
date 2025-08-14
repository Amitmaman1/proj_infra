output "namespace" {
  description = "Namespace where AWS Load Balancer Controller is installed"
  value       = kubernetes_namespace.aws_load_balancer_controller.metadata[0].name
}

output "release_name" {
  description = "Helm release name"
  value       = helm_release.aws_load_balancer_controller.name
}

output "chart_version" {
  description = "Helm chart version"
  value       = helm_release.aws_load_balancer_controller.version
}
