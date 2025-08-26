terraform {
  backend "azurerm" {
    # tenant_id = "2e119e68-e37d-48ba-85b4-0691c2c1ab19"
    # client_id = "74ff0f76-2b22-4a02-b318-472316ef730f"
    # client_secret = "YqM8Q~VkZ6Z~VcnjsIKXlmKYT8x3Va.o~_sDIcCY"
    resource_group_name = "dev-test"
    # subscription_id = "610c3c5e-6ab7-4e4d-a170-b0e9ad4f72ff"
    storage_account_name = "statefule"
    container_name = "tfstate"
    key = "dev-test.tfstate"
  }
}