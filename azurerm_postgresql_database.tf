# azurerm_postgresql_database.terraform
#
# Manages a PostgreSQL Database within a PostgreSQL Server
#
# https://registry.terraform.io/providers/hashicorp/azurerm/3.0.2/docs/resources/postgresql_database

resource "azurerm_postgresql_database" "example" {
  name                = "example-postgresql-database"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
