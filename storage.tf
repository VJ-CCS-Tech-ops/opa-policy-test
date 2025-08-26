
# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-storage-demo"
  location = "East US"
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name = "storagedemo12345" # must be globally unique
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Storage Container (public)
resource "azurerm_storage_container" "container" {
  name                  = "public-container"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "blob" # Options: private | blob | container
}
