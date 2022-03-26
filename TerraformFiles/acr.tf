terraform {
  backend "azurerm" {
    resource_group_name  = "devops-hardway-azure-stanley"
    storage_account_name = "devopsazurestanley"
    container_name       = "tfstate"
    key                  = "acrterraform.tfstate"
  }
}

provider "azurerm" {
    version = "~> 3.0"
    features {}
}

#Use existing resource group
data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

#Create Azure container registry
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = false
}

