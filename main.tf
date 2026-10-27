resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    project     = var.project_name
    environment = "dev"
    managed_by  = "terraform"
  }
}
resource "azurerm_virtual_network" "main" {
  name                = "vnet-${var.project_name}-${var.location}"
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    project     = var.project_name
    environment = "dev"
    managed_by  = "terraform"
  }
}

resource "azurerm_subnet" "app" {
  name                 = "snet-app"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_network_security_group" "app" {
  name                = "nsg-${var.project_name}-app"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    project     = var.project_name
    environment = "dev"
    managed_by  = "terraform"
  }
}

resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app.id
}
resource "random_string" "storage_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_storage_account" "main" {
  name                     = "st${replace(var.project_name, "-", "")}${random_string.storage_suffix.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    project     = var.project_name
    environment = "dev"
    managed_by  = "terraform"
  }
}
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}
resource "azurerm_service_plan" "app" {
  name                = "asp-${var.project_name}-${var.app_service_location}"
  location            = var.app_service_location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  sku_name            = "F1"

  tags = {
    project     = var.project_name
    environment = "dev"
    managed_by  = "terraform"
  }
}

resource "azurerm_linux_web_app" "app" {
  name                = "app-${replace(var.project_name, "-", "")}-${random_string.storage_suffix.result}"
  location            = var.app_service_location
  resource_group_name = azurerm_resource_group.main.name
  service_plan_id     = azurerm_service_plan.app.id
  https_only          = true

  site_config {
    always_on = false

    application_stack {
      node_version = "20-lts"
    }
  }

  tags = {
    project     = var.project_name
    environment = "dev"
    managed_by  = "terraform"
  }
}