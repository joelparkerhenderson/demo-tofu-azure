output "azurerm_resource_group" {
  value = azurerm_resource_group.demo.name
}

output "azurerm_public_ip.demo.ip_address" {
  value = azurerm_public_ip.demo.ip_address
}

output "azurerm_postgresql_server.demo.fqdn" {
  value = azurerm_postgresql_server.demo.fqdn
}

output "azurerm_postgresql_database.demo.name" {
  value = azurerm_postgresql_database.demo.name
}
