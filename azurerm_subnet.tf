# azurerm_subnet.tf
#
# Manages a subnet. Subnets represent network segments within the IP space
# defined by the virtual network.
#
# Note: Terraform currently provides both a standalone Subnet resource, and
# allows for Subnets to be defined in-line within the Virtual Network resource.
# At this time you cannot use a Virtual Network with in-line Subnets in
# conjunction with any Subnet resources. Doing so will cause a conflict of
# Subnet configurations and will overwrite Subnets.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet

resource "azurerm_subnet" "example-subnet-0" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }  
}

resource "azurerm_subnet" "example-subnet-1" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }  
}
