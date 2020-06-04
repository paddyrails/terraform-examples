resource "kubernetes_service" "docker-spring-boot" {
  metadata {
    name = "docker-spring-boot"
    labels = {
      App = "docker-spring-boot"
      version= "v1"
    }
  }
  spec {
    selector = {
       app = "docker-spring-boot"
        version= "v1"
    }
    port {
      port        = 8081
      target_port = 8081
    }

    type = "LoadBalancer"
  }
}