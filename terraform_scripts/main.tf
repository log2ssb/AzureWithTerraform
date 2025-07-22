# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  # Configure remote backend with Azure Storage Account
    # backend "azurerm" {
    #   resource_group_name  = var.tfstate_resource_group_name
    #   storage_account_name = var.tfstate_storage_account_name
    #   container_name       = var.tfstate_container_name
    #   key                  = var.tfstate_key
    # }
}

provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

# # Create resource group for the storage account
# resource "azurerm_resource_group" "tfstate_rg" {
#   name     = var.tfstate_resource_group_name
#   location = var.location
# }

# # Create storage account for Terraform state
# resource "azurerm_storage_account" "tfstate" {
#   name                     = var.tfstate_storage_account_name
#   resource_group_name      = azurerm_resource_group.tfstate_rg.name
#   location                 = azurerm_resource_group.tfstate_rg.location
#   account_tier             = var.storage_account_tier
#   account_replication_type = var.storage_account_replication_type

#   tags = {
#     environment = var.tfstate_tag_environment
#   }
# }

# # Create storage container for Terraform state
# resource "azurerm_storage_container" "tfstate_container" {
#   name                  = var.tfstate_container_name
#   storage_account_name  = azurerm_storage_account.tfstate.name
#   container_access_type = var.container_access_type
# }

# Create resource group for Web App
resource "azurerm_resource_group" "webapp_rg" {
  name     = var.webapp_resource_group_name
  location = var.location
}

# Create App Service Plan
resource "azurerm_service_plan" "app_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.webapp_rg.location
  resource_group_name = azurerm_resource_group.webapp_rg.name
  sku_name            = var.app_service_plan_sku
  os_type             = var.app_service_plan_os
}

# Create Azure Web App
resource "azurerm_linux_web_app" "webapp" {
  name                = "${var.webapp_name_prefix}-${random_string.webapp_name.result}"
  location            = azurerm_resource_group.webapp_rg.location
  resource_group_name = azurerm_resource_group.webapp_rg.name
  service_plan_id     = azurerm_service_plan.app_plan.id

  site_config {
    always_on = var.webapp_always_on
    application_stack {
      python_version = var.webapp_python_version
    }
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = var.webapp_package_setting
  }
}

# Generate random string for unique Web App name
resource "random_string" "webapp_name" {
  length  = var.random_string_length
  special = var.random_string_special
  upper   = var.random_string_upper
}

# Output the Web App URL
output "webapp_url" {
  value = azurerm_linux_web_app.webapp.default_hostname
}