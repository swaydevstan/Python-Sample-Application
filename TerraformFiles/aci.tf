# terraform {
#   backend "azurerm" {
#     resource_group_name  = "devops-hardway-azure-stanley"
#     storage_account_name = "devopsazurestanley"
#     container_name       = "tfstate"
#     key                  = "aciterraform.tfstate"
#   }
# }

# provider "azurerm" {
#     version = "~> 3.0"
#     features {}
# }

# #Use existing resource group
# data "azurerm_resource_group" "rg" {
#   name = var.rg_name
# }

#Create Azure container instance

resource "azurerm_container_group" "aci" {
  name                = var.aci_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  ip_address_type     = "Public"
  dns_name_label      = "stanacidns"
  os_type             = "Linux"

  # image_registry_credential {
  #   username = data.azurerm_container_registry.acr.admin_username
  #   password = data.azurerm_container_registry.acr.admin_password
  #   server   = data.azurerm_container_registry.acr.login_server
  # }

  container {
    name   = "uberapp"
    image  = "${data.azurerm_container_registry.acr.login_server}/aci:${var.build_id}"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

}