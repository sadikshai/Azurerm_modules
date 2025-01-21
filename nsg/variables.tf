variable "nsg_location" {
    type = string
  
}

variable "nsg_name" {
    type = string
  
}

variable "nsg_resource_group" {
    type = string
  
}





variable "nsg_security_rule" {
  type = list(object({
    name = string
    priority=number
    direction=optional(string, "Inbound")
    access=optional(string, "Deny")
    protocol=optional(string, "Tcp")
    source_port_range=optional(string, "*")
    destination_port_range=optional(string, "*")
    source_address_prefix=optional(string, "*")
    destination_address_prefix=optional(string, "*")
    
  }))
  
}


