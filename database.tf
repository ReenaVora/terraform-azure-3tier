# --------------------------

# SQL Server (Data Tier)

# --------------------------

resource "azurerm_mssql_server" "sql_server" {

  name = "sql3tier${random_string.suffix.result}"

  resource_group_name = azurerm_resource_group.rg.name

  location = azurerm_resource_group.rg.location

  version = "12.0"

  administrator_login = var.db_admin_username

  administrator_login_password = var.db_admin_password



  minimum_tls_version = "1.2"

}



resource "azurerm_mssql_database" "sql_db" {

  name = "appdb"

  server_id = azurerm_mssql_server.sql_server.id

  sku_name = "Basic"

  zone_redundant = false

}



# --------------------------

# Random suffix for globally-unique SQL Server name

# --------------------------

resource "random_string" "suffix" {

  length = 6

  upper = false

  special = false

}



# --------------------------

# Private DNS Zone for SQL

# --------------------------

resource "azurerm_private_dns_zone" "sql_priv_dns" {

  name = "privatelink.database.windows.net"

  resource_group_name = azurerm_resource_group.rg.name

}



resource "azurerm_private_dns_zone_virtual_network_link" "sql_dns_link" {

  name = "sql-dns-link"

  resource_group_name = azurerm_resource_group.rg.name

  private_dns_zone_name = azurerm_private_dns_zone.sql_priv_dns.name

  virtual_network_id = azurerm_virtual_network.vnet.id

}



# --------------------------

# Private Endpoint in db-subnet

# --------------------------

resource "azurerm_private_endpoint" "sql_pe" {

  name = "sql-private-endpoint"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  subnet_id = azurerm_subnet.db.id



  private_service_connection {

    name = "sql-pe-conn"

    private_connection_resource_id = azurerm_mssql_server.sql_server.id

    subresource_names = ["sqlServer"]

    is_manual_connection = false

  }

}
