terraform {
  required_version = ">= 1.6.0"
}

module "app_stack" {
  source      = "../../modules/app_stack"
  environment = "stage"
  services = {
    nginx  = { replicas = 2, port = 80 }
    python = { replicas = 2, port = 8080 }
    java   = { replicas = 2, port = 8080 }
  }
}

output "services" { value = module.app_stack.services }
