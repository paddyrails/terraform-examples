resource "kubernetes_deployment" "docker-spring-boot-v1" {
    metadata {
    name = "docker-spring-boot-v1"
    labels = {
      App = "docker-spring-boot"
      version= "v1"
    }
  }

 spec {
    replicas = 3

    selector {
      match_labels = {
        app = "docker-spring-boot"
        version= "v1"
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
          version= "v1"
        }
      }

      spec {
        container {
          image = "paddypillai/docker_spring_boot_v1.0.0"
          name  = "docker-spring-boot"
          port {
              container_port = 8081
          }        
          }
        }
      }
    }
  
}
