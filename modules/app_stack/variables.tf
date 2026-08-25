variable "environment" {
  description = "Environment name"
  type        = string
}

variable "services" {
  description = "Map of service configuration"
  type = map(object({
    replicas = number
    port     = number
  }))
}
