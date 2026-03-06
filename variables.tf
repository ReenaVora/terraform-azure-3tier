variable "resource_group_name" {
    description = "Name of the resource group"
    type = string
    default = "rg-terraform-3tier"
}
variable "location" {
    description = "Azure Region"
    type = string
    default = "australiaeast" 
}
variable "vnet_name"{

    description = "name of Vnet"
    type = string
    default = "vnet-3tier"

}
variable "vnet_address_space" {

    description = "Address Space for Vnet"
    type = list(string)
    default = ["10.0.0.0/16"]
}