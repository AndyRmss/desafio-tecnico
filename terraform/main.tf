resource "docker_network" "external" {
  name = "external_network"
}

resource "docker_network" "internal" {
  name = "internal_network"
}

resource "docker_container" "frontend" {
  name  = "frontend"
  image = "nginx:latest"

  ports {
    internal = 80
    external = 8080
  }

  networks_advanced {
    name = docker_network.external.name
  }

  networks_advanced {
    name = docker_network.internal.name
  }
}

resource "docker_container" "db" {
  name  = "db"
  image = "postgres:15"

  networks_advanced {
    name = docker_network.internal.name
  }

  env = [
    "POSTGRES_PASSWORD=yourpassword",
    "POSTGRES_USER=youruser",
    "POSTGRES_DB=yourdb"
  ]
}

resource "docker_container" "backend" {
  name  = "backend"
  image = "node:16-alpine"

  depends_on = [docker_container.db]

  networks_advanced {
    name = docker_network.internal.name
  }

  env = [
    "DATABASE_URL=postgresql://${docker_container.db.name}:5432/yourdb"
  ]

  command = ["tail", "-f", "/dev/null"] 
}
