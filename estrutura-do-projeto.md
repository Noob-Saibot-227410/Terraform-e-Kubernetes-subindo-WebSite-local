my-site/
  ├── index.html
  ├── css/
  │   └── style.css
  ├── js/
  │   └── script.js
  ├── Dockerfile
  ├── main.tf
  ├── variables.tf
  └── outputs.tf

index.html, css/style.css, js/script.js: arquivos que compõem o site que queremos hospedar

Dockerfile: arquivo utilizado para criar a imagem Docker do nosso site

main.tf: arquivo que contém a configuração do cluster Kubernetes, incluindo definições de recursos como deployments, services e auto-scaling

variables.tf: arquivo que contém as variáveis utilizadas no main.tf, como número de réplicas e portas

outputs.tf: arquivo que contém as saídas do Terraform, como o endereço IP e a porta em que o site estará disponível