# Saídas do Terraform
output "ip" {
  value = kubernetes_service.my_site.load_balancer_ingress[0].ip
}

output "port" {
  value = kubernetes_service.my_site.spec[0].ports[0].port
}
