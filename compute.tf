# --------------------------

# Public IP for Web VM

# --------------------------

resource "azurerm_public_ip" "web_pip" {

  name = "web-pip"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"

  sku = "Standard"

}



# --------------------------

# NICs

# --------------------------

resource "azurerm_network_interface" "web_nic" {

  name = "web-nic"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name



  ip_configuration {

    name = "web-ipconfig"

    subnet_id = azurerm_subnet.web.id

    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.web_pip.id

  }

}



resource "azurerm_network_interface" "app_nic" {

  name = "app-nic"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name



  ip_configuration {

    name = "app-ipconfig"

    subnet_id = azurerm_subnet.app.id

    private_ip_address_allocation = "Dynamic"

  }

}



# --------------------------

# Web VM (Public)

# --------------------------

resource "azurerm_windows_virtual_machine" "web_vm" {

  name = "vm-web-01"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  size = var.vm_size

  admin_username = var.admin_username

  admin_password = var.admin_password



  network_interface_ids = [

    azurerm_network_interface.web_nic.id

  ]



  os_disk {

    caching = "ReadWrite"

    storage_account_type = "Standard_LRS"

  }



  source_image_reference {

    publisher = "MicrosoftWindowsServer"

    offer = "WindowsServer"

    sku = "2022-datacenter-g2"

    version = "latest"

  }

}



# --------------------------

# App VM (Private)

# --------------------------

resource "azurerm_windows_virtual_machine" "app_vm" {

  name = "vm-app-01"

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  size = var.vm_size

  admin_username = var.admin_username

  admin_password = var.admin_password



  network_interface_ids = [

    azurerm_network_interface.app_nic.id

  ]



  os_disk {

    caching = "ReadWrite"

    storage_account_type = "Standard_LRS"

  }



  source_image_reference {

    publisher = "MicrosoftWindowsServer"

    offer = "WindowsServer"

    sku = "2022-datacenter-g2"

    version = "latest"

  }

}