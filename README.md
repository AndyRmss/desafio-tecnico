# Desafio Técnico - Cubos DevOps

## Dependências
- Docker
- Docker Compose
- Terraform

## Inicialização

1. **Build e inicialização dos containers**:
   ```bash
   docker-compose up --build
   ```

2. **Para rodar o Terraform (caso esteja configurado para orquestrar containers)**:
   ```bash
   terraform init
   terraform apply
   ```

3. **Parar os containers**:
   ```bash
   docker-compose down
   ```