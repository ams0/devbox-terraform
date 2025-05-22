resource "azurerm_resource_group" "devcenter" {
  name     = var.azurerm_dev_center_resource_group_name
  location = var.azurerm_dev_center_resource_group_location
}
resource "azurerm_dev_center" "devcenter" {
  location            = azurerm_resource_group.devcenter.location
  name                = var.azurerm_dev_center_name
  resource_group_name = azurerm_resource_group.devcenter.name

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_dev_center_environment_type" "devs" {
  name          = "devs"
  dev_center_id = azurerm_dev_center.devcenter.id

  tags = {
    Env = "Dev"
  }
}