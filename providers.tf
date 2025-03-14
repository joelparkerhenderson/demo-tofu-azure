provider "azurerm" {
    features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
  # Optional: Set the backend to store the state file
  # backend "azurerm" {
  #   resource_group_name  = "my-resource-group"
  #   storage_account_name = "mystorageaccount"
  #   container_name       = "my-container"
  #   key                  = "tofu.tfstate"
  #   subscription_id      = ""
  #   client_id            = ""
  #   tenant_id            = ""
  #   client_secret        = ""
  # }
}
