data "azuread_group" "devcenter_admins" {
  display_name     = "DevCenter Admins"
}

data "azuread_group" "devcenter_user" {
  display_name     = "DevBox Users"
}

resource "azurerm_role_assignment" "devcenter_devbox_user" {
  principal_id   = data.azuread_group.devcenter_user.object_id
  role_definition_name = "DevCenter Dev Box User"
  scope          = azurerm_dev_center_project.neutron.id
}



resource "azurerm_role_assignment" "devcenter_project_admin" {
  principal_id   = data.azuread_group.devcenter_admins.object_id
  role_definition_name = "DevCenter Project Admin"
  scope          = azurerm_dev_center.devcenter.id
}