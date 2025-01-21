resource "azurerm_network_security_group" "base" {
    location =var.nsg_location
    name = var.nsg_name
    resource_group_name = var.nsg_resource_group
  
}


resource "azurerm_network_security_rule" "rules" {
    count = length(var.nsg_security_rule)
    name = var.nsg_security_rule[count.index].name
    priority=var.nsg_security_rule[count.index].priority
    direction=var.nsg_security_rule[count.index].direction
    access=var.nsg_security_rule[count.index].access
    protocol=var.nsg_security_rule[count.index].protocol
    source_port_range=var.nsg_security_rule[count.index].source_port_range
    destination_port_range=var.nsg_security_rule[count.index].destination_address_prefix
    source_address_prefix=var.nsg_security_rule[count.index].source_address_prefix
    destination_address_prefix=var.nsg_security_rule[count.index].destination_address_prefix
    network_security_group_name = azurerm_network_security_group.base.name
    resource_group_name = var.nsg_resource_group
    
  
}