terraform {
  required_version = ">= 1.6.0"
}

resource "terraform_data" "service" {
  for_each = var.services

  input = {
    environment = var.environment
    name        = each.key
    replicas    = each.value.replicas
    port        = each.value.port
  }
}
