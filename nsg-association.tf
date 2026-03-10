resource "azurerm_subnet_network_security_group_association" "web_assoc" {

  subnet_id = azurerm_subnet.web.id

  network_security_group_id = azurerm_network_security_group.web_nsg.id

}



resource "azurerm_subnet_network_security_group_association" "app_assoc" {

  subnet_id = azurerm_subnet.app.id

  network_security_group_id = azurerm_network_security_group.app_nsg.id

}



resource "azurerm_subnet_network_security_group_association" "db_assoc" {

  subnet_id = azurerm_subnet.db.id

  network_security_group_id = azurerm_network_security_group.db_nsg.id

}