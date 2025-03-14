# azurerm_public_ip.tf
#
# Manages a Public IP Address.
#
# Note: If this resource is to be associated with a resource that requires
# disassociation before destruction (such as azurerm_network_interface) it is
# recommended to set the lifecycle argument create_before_destroy = true.
# Otherwise, it can fail to disassociate on destruction.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip

resource "azurerm_public_ip" "demo" {
  name                = "demo-public-ip"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  allocation_method   = "Static"

  tags = {
    environment = "demo"
  }
}
