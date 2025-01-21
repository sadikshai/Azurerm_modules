variable "azurerm_resource_group_name" {
    type = string
}

variable "azurerm_resource_group_location" {
    type = string
  
}

variable "virtual_network_name" {
    type = string
  
}

variable "virtual_network_location" {
    type = string
  
}

variable "virtual_network_addres_space" {
    type = string

  
}


variable "subnets_name" {
    type = list(string)
  
}


variable "subnets_address_prefixes" {
    type = list(string)
  
}