variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region for the resources."
  type        = string
  default     = "westeurope"
}

variable "project_name" {
  description = "Short name used in resource names."
  type        = string
  default     = "devops-tf"
}
variable "vnet_address_space" {
  description = "Address space for the Azure Virtual Network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the application subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "app_service_location" {
  description = "Azure region for the App Service Plan and Web App."
  type        = string
  default     = "swedencentral"
}