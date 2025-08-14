resource "kubernetes_namespace" "nginx_ingress" {
  metadata {
    name = var.namespace
    labels = {
      name = var.namespace
    }
  }
}
