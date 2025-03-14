# azurerm_network_security_group.tf

resource "azurerm_network_security_group" "demo" {
  name                = "demo-security-group"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
}