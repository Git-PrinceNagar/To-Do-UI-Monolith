terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-101-backend-app"
    storage_account_name = "stgbackendname"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e2e106a3-4a7b-4443-b147-e1da8d501783"
}
