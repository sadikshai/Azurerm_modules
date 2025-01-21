variable "ip_name" {
    type = string
  
}

variable "ip_location" {
    type = string
  
}

variable "resource_group_name" {
    type = string
  
}


variable "allocation" {
    type = string
  
}


variable "interface_name" {
    type = string
  
}

variable "ip_configuration_name" {
    type = string
  
}

variable "subnet_id" {
    type = string
  
}


variable "private_ip" {
    type = string
  
}

variable "nsg_id" {
    type = string
  
}


#virtaul machine

variable "vm_count" {
    type = number
  
}


variable "vm_names" {
    type = list(string)
  
}


variable "vm_size" {
    type =string
    default = "Standard_B1s"
  
}


variable "admin_username" {
    type = string
    default = "qtdevops"
  
}

variable "public_key_path" {
    type = string
    default = "~/.ssh/id_rsa.pub"
  
}





variable "os_disk_name" {
    type = string
  
}


variable "publisher_vm" {
    type = string
  
}


variable "offer_image" {
  type=string  
}

variable "image_sku" {
    type = string
  
}

variable "iamge_version" {
    type = string
  
}


variable "build_id" {
    type = number
  
}

variable "private_key_path" {
    type = string

  
}


variable "script" {
    type = string
  
}