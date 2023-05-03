# Provider para o Kubernetes
provider "kubernetes" {
  config_context_cluster = "docker-desktop"
}

# Cria o deployment
resource "kubernetes_deployment" "my_site" {
  metadata {
    name = "my-site"
    labels = {
      app = "my-site"
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "my-site"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-site"
        }
      }

      spec {
        container {
          image = var.docker_image
          name  = "my-site"
          ports {
            container_port = var.container_port
          }
        }
      }
    }
  }
}

# Cria o service
resource "kubernetes_service" "my_site" {
  metadata {
    name = "my-site"
  }

  spec {
    selector = {
      app = "my-site"
    }

    port {
      port        = var.service_port
      target_port = var.container_port
    }

    type = "LoadBalancer"
  }
}

# Cria o auto scaling
resource "kubernetes_horizontal_pod_autoscaler" "my_site" {
  metadata {
    name = "my-site"
  }

  spec {
    max_replicas = var.max_replicas
    min_replicas = var.min_replicas

    scale_target {
      kind = "Deployment"
      name = kubernetes_deployment.my_site.metadata[0].name
      api_version = "apps/v1"
    }

    target_cpu_utilization_percentage = var.cpu_utilization
  }
}
