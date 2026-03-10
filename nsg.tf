#Web NSG
resource "azurerm_network_security_group" "web_nsg" {

  name = "web-nsg"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name



  security_rule {

    name = "Allow-HTTP"

    priority = 100

    direction = "Inbound"

    access = "Allow"

    protocol = "Tcp"

    source_port_range = "*"

    destination_port_range = "80"

    source_address_prefix = "*"

    destination_address_prefix = "*"

  }

}



# App NSG

resource "azurerm_network_security_group" "app_nsg" {

  name = "app-nsg"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

}



# DB NSG

resource "azurerm_network_security_group" "db_nsg" {

  name = "db-nsg"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

}