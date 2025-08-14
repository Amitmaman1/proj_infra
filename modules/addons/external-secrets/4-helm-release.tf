resource "helm_release" "external_secrets" {
  name             = var.release_name
  namespace        = var.namespace
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  version          = var.chart_version
  create_namespace = false

  # IRSA binding via SA annotation to your IAM role
  values = [yamlencode({
    installCRDs = true
    serviceAccount = {
      create = true
      name   = "external-secrets"
      annotations = {
        "eks.amazonaws.com/role-arn" = var.external_role_arn
      }
    }
  })]
}
