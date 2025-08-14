output "ingress_controller_service_name" {
  description = "Name of the NGINX Ingress Controller service"
  value       = "ingress-nginx-controller"
}

output "ingress_controller_namespace" {
  description = "Namespace where NGINX Ingress Controller is installed"
  value       = kubernetes_namespace.nginx_ingress.metadata[0].name
}
