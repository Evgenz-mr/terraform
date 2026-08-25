output "services" {
  description = "Rendered service configuration"
  value       = { for name, service in terraform_data.service : name => service.output }
}
