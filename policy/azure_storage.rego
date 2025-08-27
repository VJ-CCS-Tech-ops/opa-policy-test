package terraform.azure_storage

# Deny if Storage Account allows public access
deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "azurerm_storage_account"

  public_access := resource.change.after.allow_blob_public_access
  public_access == true

  msg = sprintf("Storage Account %v allows blob public access (must be disabled).", [resource.address])
}

# Enforce HTTPS traffic only
deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "azurerm_storage_account"

  https_only := resource.change.after.enable_https_traffic_only
  https_only == false

  msg = sprintf("Storage Account %v must have HTTPS-only enabled.", [resource.address])
}

# Require minimum TLS version 1.2
deny contains msg if  {
  resource := input.resource_changes[_]
  resource.type == "azurerm_storage_account"

  tls_version := resource.change.after.min_tls_version
  not tls_version == "TLS1_2"

  msg = sprintf("Storage Account %v must use min_tls_version = TLS1_2.", [resource.address])
}

# Request region to be UKSouthd

deny contains msg if {
  resource := input.resource_changes[_]
  resource.type == "azurerm_storage_account"

  location := lower(resource.change.after.location)
    us_regions := {"eastus", "eastus2", "westus", "westus2", "centralus", "northcentralus", "southcentralus"}

  location == us_regions[_]

  msg := sprintf("Azure Storage Account '%v' must not be deployed in US region (%v)", [resource.name, location])
}