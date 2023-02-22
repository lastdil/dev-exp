terraform {
  required_version = ">= 1.1.6"
  required_providers {
    postgresql = { # This line is what needs to change.
      source  = "cyrilgdn/postgresql"
      version = "1.15.0"
    }
    aws        = ">4.50.0"
    kubernetes = ">2"
  }
}