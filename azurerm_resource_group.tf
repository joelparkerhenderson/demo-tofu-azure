# azurerm_resource_group.tf
#
# Manages a Resource Group.
#
# Note: Azure automatically deletes any Resources nested within the Resource Group when a Resource Group is deleted.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "East US"
}
