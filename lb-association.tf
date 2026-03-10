resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb" {

  network_interface_id = azurerm_network_interface.web_nic.id

  ip_configuration_name = "web-ipconfig"

  backend_address_pool_id = azurerm_lb_backend_address_pool.web_pool.id

}