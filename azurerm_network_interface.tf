# azurerm_network_interface.terraform
#
# Manages a Network Interface.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface.html

resource "azurerm_network_interface" "demo" {
  name                = "demo-nic"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name

  ip_configuration {
    name                          = "demo-ip-config"
    subnet_id                     = azurerm_subnet.demo.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.demo.id
  }
}
