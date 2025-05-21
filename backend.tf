terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "4.29.0"
        }
    }

    required_version = ">= 1.0.0"

    backend "azurerm" {
        resource_group_name  = "resources"      # Replace with your resource group
        storage_account_name = "contostore"     # Replace with your storage account
        container_name       = "tfstate"              # Replace with your container name
        key                  = "devcenter.tfstate"    # State file name
    }
}

provider "azurerm" {
    features {}
}