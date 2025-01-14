variable "frontend_image" {
  type    = string
  default = "nginx:latest"
}

variable "db_image" {
  type    = string
  default = "postgres:15"
}

variable "backend_image" {
  type    = string
  default = "your_backend_image"
}

variable "postgres_password" {
  type    = string
  default = "yourpassword"
}

variable "postgres_user" {
  type    = string
  default = "youruser"
}

variable "postgres_db" {
  type    = string
  default = "yourdb"
}
