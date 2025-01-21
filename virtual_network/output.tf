output "subnets_id" {
    value = azurerm_subnet.subnets[*].id
  
}

output "subnets_name" {
    value = azurerm_subnet.subnets[*].name
  
}

output "resource_group_name" {
    value = azurerm_resource_group.base.name
  
}

output "virtual_network_name" {
    value = azurerm_virtual_network.vnet.name
  
}


output "azurerm_resource_group_location" {
    value = azurerm_resource_group.base.location
  
}