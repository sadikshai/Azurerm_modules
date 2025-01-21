resource "azurerm_public_ip" "base" {
    count = var.vm_count
    name="${var.ip_name}-${count.index}"
    location = var.ip_location
    resource_group_name = var.resource_group_name
    allocation_method = var.allocation
  
}


resource "azurerm_network_interface" "nic" {
    count = var.vm_count
    name="${var.interface_name}-${count.index}"
    resource_group_name = var.resource_group_name
    location = var.ip_location
    ip_configuration {
      name = var.ip_configuration_name
      subnet_id=var.subnet_id
      public_ip_address_id=azurerm_public_ip.base[count.index].id
      private_ip_address_allocation=var.private_ip
    }
  
}


resource "azurerm_network_interface_security_group_association" "nictonsg"{
    count = var.vm_count  
    network_interface_id = azurerm_network_interface.nic[count.index].id
    network_security_group_id =var.nsg_id 
}


resource "azurerm_linux_virtual_machine" "web" {
    count = var.vm_count
    name = var.vm_names[count.index]
    resource_group_name = var.resource_group_name
    size = var.vm_size
    admin_username=var.admin_username
    location = var.ip_location
    network_interface_ids=[
    azurerm_network_interface.nic[count.index].id]
    admin_ssh_key {
      username=var.admin_username
      public_key=file(var.public_key_path)
    }
    os_disk {
      name=var.os_disk_name
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
      publisher=var.publisher_vm
      offer=var.offer_image
      sku=var.image_sku
      version=var.iamge_version
    }
  
}


resource "null_resource" "webnull" {
  count = var.vm_count
  triggers = {
    trigger_build_id=var.build_id
  }
  connection {
    host = azurerm_linux_virtual_machine.web[count.index].public_ip_address
    type = "ssh"
    user = var.admin_username
    private_key = file(var.private_key_path)
  }

  provisioner "remote-exec" {
        script = var.script
      
    }
  
}