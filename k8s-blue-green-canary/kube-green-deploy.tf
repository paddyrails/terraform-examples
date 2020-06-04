resource "kubernetes_deployment" "docker-spring-boot-v2" {
    metadata {
    name = "docker-spring-boot-v2"
    labels = {
      App = "docker-spring-boot"
      version= "v2"
    }
  }

 spec {
    replicas = 3

    selector {
      match_labels = {
        app = "docker-spring-boot"
        version= "v2"
      }
    }


    strategy{
        type = "RollingUpdate"
        rolling_update {
            max_unavailable = 0
            max_surge =  1
        }
    }
    template {
      metadata {
        labels = {
          app = "docker-spring-boot"
          version= "v2"
        }
      }

      spec {
        container {
          image = "paddypillai/docker_spring_boot_v2.0.0"
          name  = "docker-spring-boot"
          port {
              container_port = 8081
          }        
          }
        }
      }
    }
  
}
