# azurerm_virtual_network.tf
#
# Manages a virtual network including any configured subnets. Each subnet can
# optionally be configured with a security group to be associated with the
# subnet.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "demo" {
  name                = "demo-network"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefix   = "10.0.1.0/24"
  }

  subnet {
    name             = "subnet2"
    address_prefix   = "10.0.2.0/24"
    security_group   = azurerm_network_security_group.demo.id
  }

  tags = {
    environment = "Production"
  }
}
