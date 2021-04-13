provider "kubernetes" {
  config_context_cluster   = "minikube"
}


resource "kubernetes_secret" "myexample" {
  metadata {
    name = "my-basic-auth"
  }

  data = {
    username = "admin"
    password = "P4ssw0rd"
  }

  type = "kubernetes.io/basic-auth"
}


resource "kubernetes_pod" "mypod1" {
  metadata {
    name = "podwebname"
  }

  spec {
    container {
      image = "vimal13/apache-webserver-php"
      name  = "mywebcon"
       }
   }
}

