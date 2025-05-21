resource "azurerm_shared_image_gallery" "devboxes" {
  name                = "devboxes"
  location            = azurerm_resource_group.devcenter.location
  resource_group_name = azurerm_resource_group.devcenter.name
}

# resource "azurerm_dev_center_gallery" "devboxes" {
#   dev_center_id     = azurerm_dev_center.devcenter.id
#   shared_gallery_id = azurerm_shared_image_gallery.devboxes.id
#   name              = "devboxes"
# }