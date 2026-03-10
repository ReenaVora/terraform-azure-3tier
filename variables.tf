variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-terraform-3tier"
}
variable "location" {
  description = "Azure Region"
  type        = string
  default     = "australiaeast"
}
variable "vnet_name" {

  description = "name of Vnet"
  type        = string
  default     = "vnet-3tier"

}
variable "vnet_address_space" {

  description = "Address Space for Vnet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
variable "vm_size" {
  type        = string
  description = "VM size for Web/App VMs"
  default     = "Standard_D2a_v4"
}
variable "admin_username" {
  type        = string
  description = "Windows VM admin username"
  default     = "azureadmin"
}
variable "admin_password" {
  type        = string
  description = "Windows VM admin password (12+ chars). keep out of Github"
  sensitive   = true
}