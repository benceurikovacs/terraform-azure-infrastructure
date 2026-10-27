output "resource_group_name" {
  description = "Name of the created Resource Group."
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Azure region of the Resource Group."
  value       = azurerm_resource_group.main.location
}
output "virtual_network_name" {
  description = "Name of the created Virtual Network."
  value       = azurerm_virtual_network.main.name
}

output "subnet_name" {
  description = "Name of the application subnet."
  value       = azurerm_subnet.app.name
}

output "network_security_group_name" {
  description = "Name of the application Network Security Group."
  value       = azurerm_network_security_group.app.name
}
output "storage_account_name" {
  description = "Name of the created Storage Account."
  value       = azurerm_storage_account.main.name
}
output "terraform_state_container_name" {
  description = "Name of the private Blob Storage container for Terraform state."
  value       = azurerm_storage_container.tfstate.name
}
output "app_service_plan_name" {
  description = "Name of the created App Service Plan."
  value       = azurerm_service_plan.app.name
}

output "web_app_name" {
  description = "Name of the created Linux Web App."
  value       = azurerm_linux_web_app.app.name
}

output "web_app_url" {
  description = "Default HTTPS URL of the Linux Web App."
  value       = "https://${azurerm_linux_web_app.app.default_hostname}"
}