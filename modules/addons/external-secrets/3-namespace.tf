resource "kubernetes_namespace" "external_secrets" {
  metadata { name = var.namespace }
}
