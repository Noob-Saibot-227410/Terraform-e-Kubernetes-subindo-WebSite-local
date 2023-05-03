# Variáveis utilizadas no main.tf
variable "docker_image" {
  description = "Nome da imagem Docker a ser utilizada"
  default     = "my-site"
}

variable "replicas" {
  description = "Número de réplicas do deployment"
  default     = 2
}

variable "container_port" {
  description = "Porta do container"
  default     = 5000
}

variable "service_port" {
  description = "Porta do serviço"
  default     = 80
}

variable "max_replicas" {
  description = "Número máximo de réplicas para o auto-scaling"
  default     = 5
}

variable "min_replicas" {
  description = "Número mínimo de réplicas para o auto-scaling"
  default     = 2
}

variable "cpu_utilization" {
  description = "Porcentagem de utilização de CPU para o auto-scaling"
  default     = 50
}
