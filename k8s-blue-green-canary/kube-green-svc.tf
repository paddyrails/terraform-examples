resource "kubernetes_service" "docker-spring-boot-v2" {
  metadata {
    name = "docker-spring-boot-v2"
    labels = {
      App = "docker-spring-boot-v2"
      version= "v2"
    }
  }
  spec {
    selector = {
       app = "docker-spring-boot"
        version= "v2"
    }
    port {
      port        = 8081
      target_port = 8081
    }

    type = "LoadBalancer"
  }
}