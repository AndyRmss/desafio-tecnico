# Desafio Técnico - Cubos DevOps

## Descrição
Este repositório contém o código para um ambiente de DevOps seguro e replicável, utilizando **Docker**, **Terraform**, **JavaScript** e **PostgreSQL**. O objetivo é configurar um ambiente de serviços que se comunica de forma segura entre si, com a exposição de um frontend para o usuário e a comunicação com um backend que acessa um banco de dados PostgreSQL.

## Dependências
Antes de rodar o projeto, certifique-se de que as seguintes dependências estão instaladas:

- [Docker](https://www.docker.com/get-started)
- [Terraform](https://www.terraform.io/downloads.html)
- [Node.js](https://nodejs.org/)
- [PostgreSQL](https://www.postgresql.org/)

## Instruções de Inicialização

### Configurar o Ambiente com Docker

 **Build dos containers**:
   Navegue até o diretório raiz do projeto e execute o seguinte comando para construir os containers:

   ```bash
   docker-compose build

   docker-compose up -d
   ```
### Configurar a Infraestrutura com Terraform

 **Infraestrutura Terraform**:
 
   ```bash
   terraform init

   terraform apply
   ```
### Acessar a Aplicação
Após configurar e rodar os containers, você pode acessar a aplicação:

   Frontend (via navegador): Acesse o frontend na URL http://localhost:8081
   Backend: A comunicação com o backend é feita via proxy /api a partir do frontend.

### Parar os containers

Para parar os containers, execute o comando:

**Parar os containers**:
   ```bash
   docker-compose down
   ```