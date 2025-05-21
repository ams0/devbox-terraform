variable "azurerm_dev_center_name" {
  description = "The name of the Dev Center."
  type        = string
  }

  variable "azurerm_dev_center_resource_group_name" {
  description = "The name of the resource group where the Dev Center is located."
  type        = string  
  
  }

variable "azurerm_dev_center_resource_group_location" {
  description = "The location of the resource group where the Dev Center is located."
  type        = string
  default     = "West Europe"
  
}

variable "azurerm_dev_center_location" {
  description = "The location of the Dev Center."
  type        = string
  default     = "West Europe"
}

variable "dev_project_max_boxes_per_user" {
  description = "The maximum number of dev boxes per user in the project."
  type        = number
  default     = 5
  
}