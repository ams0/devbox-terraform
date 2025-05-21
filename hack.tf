resource "azapi_update_resource" "add_hibernate_support" {
  type        = "Microsoft.DevCenter/devcenters/devboxdefinitions@2024-10-01-preview"
  resource_id = azurerm_dev_center_dev_box_definition.basebox.id
  body = {
    properties = {
      hibernateSupport = "Enabled"
    }
  }
}