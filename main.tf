resource "random_string" "random" {
  length = 5
  special = false
  upper = false
}

resource "azurerm_key_vault" "main" {
  name                        = "${var.base_name}kv${random_string.random.result}"
  resource_group_name         = data.azurerm_resource_group.rg.name
  location                    = var.location
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = true
  purge_protection_enabled    = false

  sku_name = "standard"

  network_acls {
    default_action              = "Deny"
    bypass                      = "AzureServices"
    ip_rules                    = var.authorized_cidrs
    virtual_network_subnet_ids  = var.authorized_subnet_ids
  }

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "access_policies" {
  for_each = var.authorized_entities

  key_vault_id = azurerm_key_vault.main.id

  tenant_id = each.value.tenant_id
  object_id = each.value.object_id
  key_permissions = each.value.key_permissions
  secret_permissions = each.value.secret_permissions
  certificate_permissions = each.value.certificate_permissions
  storage_permissions = each.value.storage_permissions
}