# azurerm_postgresql_database.terraform
#
# Manages a PostgreSQL Database within a PostgreSQL Server
#
# https://registry.terraform.io/providers/hashicorp/azurerm/3.0.2/docs/resources/postgresql_database

resource "azurerm_postgresql_database" "demo" {
  name                = "demo-postgresql-database"
  resource_group_name = azurerm_resource_group.demo.name
  server_name         = azurerm_postgresql_server.demo.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
