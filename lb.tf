# Public IP for Load Balancer

resource "azurerm_public_ip" "lb_pip" {

  name = "lb-pip"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"

  sku = "Standard"

}



# Standard Load Balancer

resource "azurerm_lb" "web_lb" {

  name = "web-lb"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  sku = "Standard"



  frontend_ip_configuration {

    name = "lb-frontend"

    public_ip_address_id = azurerm_public_ip.lb_pip.id

  }

}



# Backend Pool

resource "azurerm_lb_backend_address_pool" "web_pool" {

  name = "web-backend-pool"

  loadbalancer_id = azurerm_lb.web_lb.id

}



# Health Probe (HTTP 80)

resource "azurerm_lb_probe" "http_probe" {

  name = "http-probe"

  loadbalancer_id = azurerm_lb.web_lb.id

  protocol = "Http"

  port = 80

  request_path = "/"

}



# Load Balancing Rule (HTTP 80)

resource "azurerm_lb_rule" "http_rule" {

  name = "http-rule"

  loadbalancer_id = azurerm_lb.web_lb.id

  protocol = "Tcp"

  frontend_port = 80

  backend_port = 80

  frontend_ip_configuration_name = "lb-frontend"

  backend_address_pool_ids = [azurerm_lb_backend_address_pool.web_pool.id]

  probe_id = azurerm_lb_probe.http_probe.id

}

 