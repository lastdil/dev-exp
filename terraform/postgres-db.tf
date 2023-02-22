provider "postgresql" {
  host     = "localhost"
  port     = 5432
  username = "postgres"
  password = "124asd"
  sslmode  = "disable"
}

resource "random_password" "pg_password" {
  length = 16
}

#resource "aws_secretsmanager_secret" "database_password" {
#  name = "dev/k8s/service_exp/db/password"
#}
#
#resource "aws_secretsmanager_secret_version" "database_password" {
#  secret_id     = aws_secretsmanager_secret.database_password.id
#  secret_string = random_password.pg_password.result
#}

resource "postgresql_role" "pg_user" {
  name        = "service_exp"
  create_role = true
  login       = true
  password    = random_password.pg_password.result
}

resource "postgresql_database" "pg_db" {
  name  = "service_exp"
  owner = postgresql_role.pg_user.name
}
