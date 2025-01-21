resource "azurerm_resource_group" "base" {
name = var.azurerm_resource_group_name
location = var.azurerm_resource_group_location
}


resource "azurerm_virtual_network" "vnet" {
    name = var.virtual_network_name
    location = var.virtual_network_location
    resource_group_name = azurerm_resource_group.base.name
    address_space = [var.virtual_network_addres_space]
  
}


resource "azurerm_subnet" "subnets" {
    count = length(var.subnets_name)
    resource_group_name = azurerm_resource_group.base.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    name = var.subnets_name[count.index]
    address_prefixes =  [var.subnets_address_prefixes [count.index]]
  
}