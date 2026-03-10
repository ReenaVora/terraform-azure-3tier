output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}
output "web_vm_public_ip" {
  value = azurerm_public_ip.web_pip.ip_address

}
output "lb_public_ip" {
  value = azurerm_public_ip.lb_pip.ip_address
}