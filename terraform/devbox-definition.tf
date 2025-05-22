resource "azurerm_dev_center_dev_box_definition" "basebox" {
  name               = "basebox"
  location           = azurerm_resource_group.devcenter.location
  dev_center_id      = azurerm_dev_center.devcenter.id
  image_reference_id = "${azurerm_dev_center.devcenter.id}/galleries/default/images/microsoftvisualstudio_visualstudioplustools_vs-2022-ent-general-win10-m365-gen2"
  sku_name           = "general_i_8c32gb256ssd_v2"
}

resource "azurerm_dev_center_dev_box_definition" "prodbox" {
  name               = "prodbox"
  location           = azurerm_resource_group.devcenter.location
  dev_center_id      = azurerm_dev_center.devcenter.id
  image_reference_id = "${azurerm_dev_center.devcenter.id}/galleries/default/images/microsoftvisualstudio_visualstudioplustools_vs-2022-ent-general-win10-m365-gen2"
  sku_name           = "general_i_8c32gb256ssd_v2"
}