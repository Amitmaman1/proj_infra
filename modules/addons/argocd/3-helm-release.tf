resource "helm_release" "argocd" {
  name       = var.release_name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.chart_version
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "server.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
  }

  set {
    name  = "server.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-scheme"
    value = "internet-facing"
  }

  set {
    name  = "server.ingress.enabled"
    value = "false"
  }

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.admin_password
  }

  set {
    name  = "configs.secret.argocdServerAdminPasswordMtime"
    value = "2024-01-01T00:00:00Z"
  }

  depends_on = [kubernetes_namespace.argocd]
}