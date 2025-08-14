output "dev_namespace" {
  description = "Dev namespace name"
  value       = var.environment == "dev" ? kubernetes_namespace.dev[0].metadata[0].name : null
}

output "staging_namespace" {
  description = "Staging namespace name"
  value       = var.environment == "dev" ? kubernetes_namespace.staging[0].metadata[0].name : null
}

output "production_namespace" {
  description = "Production namespace name"
  value       = var.environment == "prod" ? kubernetes_namespace.production[0].metadata[0].name : null
}

output "environment" {
  description = "Current environment"
  value       = var.environment
}
