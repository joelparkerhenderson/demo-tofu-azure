# azurerm_network_interface.terraform
#
# Manages a Network Interface.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface.html

resource "azurerm_network_interface" "example" {
  name                = "demo-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "demo-ip-configuration"
    subnet_id                     = azurerm_subnet.example-subnet-0.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}
