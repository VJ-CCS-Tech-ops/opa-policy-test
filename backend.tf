terraform {
  backend "azurerm" {
    resource_group_name = "dev-test"
    resource_group_name = "dev-test"
    storage_account_name = "statefule"
    container_name = "tfstate"
    key = "dev-test.tfstate"
  }
}