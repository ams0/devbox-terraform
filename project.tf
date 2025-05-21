data "azurerm_client_config" "current" {}

resource "azurerm_dev_center_project" "neutron" {
  dev_center_id       = azurerm_dev_center.devcenter.id
  location            = azurerm_resource_group.devcenter.location
  name                = "neutron"
  resource_group_name = azurerm_resource_group.devcenter.name

  maximum_dev_boxes_per_user = var.dev_project_max_boxes_per_user
}

# resource "azurerm_dev_center_project_environment_type" "dev" {
#   name                  = "dev"
#   location              = azurerm_resource_group.devcenter.location
#   dev_center_project_id = azurerm_dev_center_project.neutron.id
#   deployment_target_id  = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"

#   identity {
#     type = "SystemAssigned"
#   }
# }