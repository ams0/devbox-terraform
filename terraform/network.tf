resource "azurerm_virtual_network" "devcenter" {
  name                = "devcenter-vnet"
  address_space       = ["10.200.0.0/16"]
  location            = azurerm_resource_group.devcenter.location
  resource_group_name = azurerm_resource_group.devcenter.name
}

resource "azurerm_subnet" "devboxes" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.devcenter.name
  virtual_network_name = azurerm_virtual_network.devcenter.name
  address_prefixes     = ["10.200.200.0/24"]
}

resource "azurerm_dev_center_network_connection" "devnet" {
  name                = "devnet-connection"
  resource_group_name = azurerm_resource_group.devcenter.name
  location            = azurerm_resource_group.devcenter.location
  domain_join_type    = "AzureADJoin"
  subnet_id           = azurerm_subnet.devboxes.id
}

resource "azurerm_dev_center_attached_network" "devcenter-attached-network" {
  name                  = "devcenter-attached-network"
  dev_center_id         = azurerm_dev_center.devcenter.id
  network_connection_id = azurerm_dev_center_network_connection.devnet.id
}