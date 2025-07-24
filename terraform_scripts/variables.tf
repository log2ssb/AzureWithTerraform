# Variables for Terraform state backend
variable "tenant_id" {
  type = string
  default = "14048a0c-961f-4ade-8b51-34d996953e8a"
}
variable "subscription_id" {
  type = string
  default = "67b5d626-6793-4865-84b8-57330f18fb6c"
}
variable "client_id" {
  type = string
  default = "d90001fa-76a7-44d0-8566-8b3589f5c039"
}
variable "client_secret" {
  type = string
}
variable "tfstate_resource_group_name" {
  description = "Name of the resource group for Terraform state"
  type        = string
  default     = "rg-tfstate"
}

variable "tfstate_storage_account_name" {
  description = "Name of the storage account for Terraform state"
  type        = string
  default     = "sademo2706"
}

variable "tfstate_container_name" {
  description = "Name of the storage container for Terraform state"
  type        = string
  default     = "tfstate"
}

variable "tfstate_key" {
  description = "Key for the Terraform state file in the storage container"
  type        = string
  default     = "terraform.tfstate"
}

# Variables for storage account configuration
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "centralindia"
}

variable "storage_account_tier" {
  description = "Tier for the storage account"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Replication type for the storage account"
  type        = string
  default     = "LRS"
}

variable "tfstate_tag_environment" {
  description = "Environment tag for Terraform state resources"
  type        = string
  default     = "terraform-state"
}

variable "container_access_type" {
  description = "Access type for the storage container"
  type        = string
  default     = "private"
}

# Variables for Web App resources
variable "webapp_resource_group_name" {
  description = "Name of the resource group for Web App"
  type        = string
  default     = "rg-webapp"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "asp-webapp"
}

variable "app_service_plan_sku" {
  description = "SKU for the App Service Plan"
  type        = string
  default     = "F1"
}

variable "app_service_plan_os" {
  description = "Operating system for the App Service Plan"
  type        = string
  default     = "Linux"
}

variable "webapp_name_prefix" {
  description = "Prefix for the Web App name"
  type        = string
  default     = "mywebapp"
}

variable "webapp_always_on" {
  description = "Always On setting for the Web App"
  type        = bool
  default     = false
}

variable "webapp_NodeJS_version" {
  description = "NodeJS version for the Web App"
  type        = string
  default     = "20-lts"
}

variable "webapp_package_setting" {
  description = "App setting for running from package"
  type        = string
  default     = "1"
}

# Variables for random string generation
variable "random_string_length" {
  description = "Length of the random string for Web App name"
  type        = number
  default     = 8
}

variable "random_string_special" {
  description = "Include special characters in random string"
  type        = bool
  default     = false
}

variable "random_string_upper" {
  description = "Include uppercase letters in random string"
  type        = bool
  default     = false
}