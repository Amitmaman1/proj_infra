resource "helm_release" "aws_load_balancer_controller" {
  name       = var.release_name
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = var.chart_version
  namespace  = kubernetes_namespace.aws_load_balancer_controller.metadata[0].name

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "region"
    value = var.aws_region
  }

  set {
    name  = "vpcId"
    value = var.vpc_id
  }

  depends_on = [kubernetes_namespace.aws_load_balancer_controller, kubernetes_service_account.aws_load_balancer_controller]
}
