# Azure Virtual Machine Deployment Terraform Module

This Terraform module deploys Linux Virtual Machines (VMs) in Azure, including associated resources such as Public IPs, Network Interfaces, and Network Security Group associations.

## Features

- Deploys multiple Linux VMs.
- Creates and associates Public IPs and Network Interfaces.
- Configures Network Security Group associations for VMs.
- Supports remote script execution on deployed VMs.

## Prerequisites

- Terraform installed on your machine.
- Azure CLI installed and authenticated to your Azure subscription.
- An existing resource group, subnet, and NSG in Azure.

## Usage

Below is an example of how to use this module in your Terraform configuration:

```hcl
module "azure_vm" {
  source                = "./path/to/this/module"

  ip_name               = "my-ip"
  ip_location           = "East US"
  resource_group_name   = "my-resource-group"
  allocation            = "Dynamic"

  interface_name        = "my-interface"
  ip_configuration_name = "ipconfig1"
  subnet_id             = "/subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.Network/virtualNetworks/<vnet-name>/subnets/<subnet-name>"
  private_ip            = "Dynamic"
  nsg_id                = "/subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.Network/networkSecurityGroups/<nsg-name>"

  vm_count              = 1
  vm_names              = ["my-vm"]
  vm_size               = "Standard_B1s"
  admin_username        = "azureuser"
  public_key_path       = "~/.ssh/id_rsa.pub"

  os_disk_name          = "my-os-disk"
  publisher_vm          = "Canonical"
  offer_image           = "UbuntuServer"
  image_sku             = "18.04-LTS"
  iamge_version         = "latest"

  build_id              = 1
  private_key_path      = "~/.ssh/id_rsa"
  script                = "path/to/script.sh"
}
```

## Inputs

| Name                   | Type           | Description                                                                                 | Default             | Required |
|------------------------|----------------|---------------------------------------------------------------------------------------------|---------------------|----------|
| `ip_name`              | `string`       | The name of the public IP.                                                                 | `null`              | Yes      |
| `ip_location`          | `string`       | The location for the public IP.                                                            | `null`              | Yes      |
| `resource_group_name`  | `string`       | The name of the resource group where resources will be created.                            | `null`              | Yes      |
| `allocation`           | `string`       | The allocation method for the public IP (`Dynamic` or `Static`).                           | `null`              | Yes      |
| `interface_name`       | `string`       | The name of the network interface.                                                         | `null`              | Yes      |
| `ip_configuration_name`| `string`       | The name of the IP configuration.                                                          | `null`              | Yes      |
| `subnet_id`            | `string`       | The ID of the subnet.                                                                      | `null`              | Yes      |
| `private_ip`           | `string`       | The allocation method for private IP (`Dynamic` or `Static`).                              | `null`              | Yes      |
| `nsg_id`               | `string`       | The ID of the Network Security Group to associate with the network interface.              | `null`              | Yes      |
| `vm_count`             | `number`       | The number of VMs to deploy.                                                               | `null`              | Yes      |
| `vm_names`             | `list(string)` | The names of the VMs to deploy.                                                            | `null`              | Yes      |
| `vm_size`              | `string`       | The size of the VMs.                                                                       | `"Standard_B1s"`    | No       |
| `admin_username`       | `string`       | The admin username for the VM.                                                             | `"qtdevops"`        | No       |
| `public_key_path`      | `string`       | Path to the public SSH key for admin access.                                               | `"~/.ssh/id_rsa.pub"` | No       |
| `os_disk_name`         | `string`       | The name of the OS disk.                                                                   | `null`              | Yes      |
| `publisher_vm`         | `string`       | The publisher of the image to use for the VM.                                              | `null`              | Yes      |
| `offer_image`          | `string`       | The offer of the image to use for the VM.                                                  | `null`              | Yes      |
| `image_sku`            | `string`       | The SKU of the image to use for the VM.                                                    | `null`              | Yes      |
| `iamge_version`        | `string`       | The version of the image to use for the VM.                                                | `null`              | Yes      |
| `build_id`             | `number`       | An ID used to trigger builds for `null_resource`.                                          | `null`              | Yes      |
| `private_key_path`     | `string`       | Path to the private SSH key for remote provisioning.                                       | `null`              | Yes      |
| `script`               | `string`       | Path to the script to run during remote provisioning.                                      | `null`              | Yes      |

## Outputs

| Name            | Description                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| `web-url`       | The public URL of the deployed web server.                                 |
| `ssh_command`   | The SSH command to connect to the deployed VM.                             |
| `deploy_template` | The URL of the deployed application template (e.g., `/cafe`).             |

## Steps to Deploy

1. Clone this repository or copy the module into your Terraform configuration.
2. Update the input values as needed.
3. Run the following commands:

   ```bash
   terraform init       # Initialize the Terraform working directory
   terraform plan       # Preview the changes Terraform will make
   terraform apply      # Apply the changes to create the resources
   ```

4. Verify the resources are created in the Azure portal.

## Notes

- Ensure the resource group, subnet, and NSG exist before deploying this module.
- Customize the script for remote provisioning as per your application's requirements.

## License

This project is licensed under the MIT License.
