resource "kubernetes_namespace" "aws_load_balancer_controller" {
  metadata {
    name = var.namespace
    labels = {
      name = var.namespace
    }
  }
}
