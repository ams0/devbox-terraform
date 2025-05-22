resource "azurerm_dev_center_project_pool" "devpool" {
  name                                    = "devpool"
  location                                = azurerm_resource_group.devcenter.location
  dev_center_project_id                   = azurerm_dev_center_project.neutron.id
  dev_box_definition_name                 = azurerm_dev_center_dev_box_definition.basebox.name
  local_administrator_enabled             = true
  dev_center_attached_network_name        = azurerm_dev_center_attached_network.devcenter-attached-network.name
  stop_on_disconnect_grace_period_minutes = 60
}

resource "azurerm_dev_center_project_pool" "prodpool" {
  name                                    = "prodpool"
  location                                = azurerm_resource_group.devcenter.location
  dev_center_project_id                   = azurerm_dev_center_project.neutron.id
  dev_box_definition_name                 = azurerm_dev_center_dev_box_definition.basebox.name
  local_administrator_enabled             = true
  dev_center_attached_network_name        = azurerm_dev_center_attached_network.devcenter-attached-network.name
  stop_on_disconnect_grace_period_minutes = 60
}
