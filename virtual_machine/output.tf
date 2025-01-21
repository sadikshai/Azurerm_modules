output "web-url" {
  
  value = format("http://%s",
  azurerm_linux_virtual_machine.web[0].public_ip_address)
  description = "The public URL of the web server"
}

output "ssh_comand" {
  value = format("ssh -i %s %s@%s",
    var.private_key_path,              
    var.admin_username,                 
    azurerm_linux_virtual_machine.web[0].public_ip_address 
  )
}


output "deploy_template" {
    value = "http://${azurerm_linux_virtual_machine.web[0].public_ip_address}/cafe"
  
}