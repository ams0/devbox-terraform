resource "azurerm_key_vault" "catalog" {
  name                = "${var.azurerm_dev_center_name}-catalog-kv"
  location            = azurerm_resource_group.devcenter.location
  resource_group_name = azurerm_resource_group.devcenter.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
      "List",
      "Update",
      "Delete",
      "Purge",
      "Recover"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azurerm_dev_center.devcenter.identity[0].principal_id

    key_permissions = [
      "Get",
      "List",
      "Decrypt",
      "Encrypt"
    ]
  }
}

resource "azurerm_key_vault_key" "catalog" {
  name         = "catalog-encryption-key"
  key_vault_id = azurerm_key_vault.catalog.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  depends_on = [azurerm_key_vault.catalog]
}

resource "azurerm_dev_center_catalog" "definitions" {
  name                = "example"
  resource_group_name = azurerm_resource_group.devcenter.name
  dev_center_id       = azurerm_dev_center.devcenter.id
  catalog_github {
    branch            = "main"
    path              = "DevBox-definitions"
    uri               = "https://github.com/ams0/devcenter-catalog"
    key_vault_key_url = azurerm_key_vault_key.catalog.id
  }
}
