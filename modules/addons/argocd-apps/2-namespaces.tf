resource "kubernetes_namespace" "dev" {
  count = var.environment == "dev" ? 1 : 0
  
  metadata {
    name = "dev"
    labels = {
      name = "dev"
    }
  }
}

resource "kubernetes_namespace" "staging" {
  count = var.environment == "dev" ? 1 : 0
  
  metadata {
    name = "staging"
    labels = {
      name = "staging"
    }
  }
}

resource "kubernetes_namespace" "production" {
  count = var.environment == "prod" ? 1 : 0
  
  metadata {
    name = "production"
    labels = {
      name = "production"
    }
  }
}
