resource "kubernetes_manifest" "dev_app" {
  count = var.environment == "dev" ? 1 : 0
  
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "dev-app"
      namespace = "argocd"
    }
    spec = {
      project = "default"
      source = {
        repoURL        = var.app_repo_url
        targetRevision = var.app_target_revision
        path          = var.app_path
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "dev"
      }
      syncPolicy = {
        automated = {
          prune      = true
          selfHeal   = true
          allowEmpty = true
        }
        syncOptions = ["CreateNamespace=true"]
      }
    }
  }
}

resource "kubernetes_manifest" "staging_app" {
  count = var.environment == "dev" ? 1 : 0
  
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "staging-app"
      namespace = "argocd"
    }
    spec = {
      project = "default"
      source = {
        repoURL        = var.app_repo_url
        targetRevision = var.app_target_revision
        path          = var.app_path
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "staging"
      }
      syncPolicy = {
        automated = {
          prune      = true
          selfHeal   = true
          allowEmpty = true
        }
        syncOptions = ["CreateNamespace=true"]
      }
    }
  }
}

resource "kubernetes_manifest" "production_app" {
  count = var.environment == "prod" ? 1 : 0
  
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "production-app"
      namespace = "argocd"
    }
    spec = {
      project = "default"
      source = {
        repoURL        = var.app_repo_url
        targetRevision = var.app_target_revision
        path          = var.app_path
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "production"
      }
      syncPolicy = {
        automated = {
          prune      = true
          selfHeal   = true
          allowEmpty = true
        }
        syncOptions = ["CreateNamespace=true"]
      }
    }
  }
}
