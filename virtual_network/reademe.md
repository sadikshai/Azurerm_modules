# Azure Network Infrastructure Terraform Module

This Terraform module deploys an Azure Resource Group, a Virtual Network (VNet), and multiple Subnets.

## Features

- Creates a resource group in Azure.
- Deploys a virtual network (VNet) in the specified location.
- Creates multiple subnets within the VNet.

## Prerequisites

- Terraform installed on your machine.
- Azure CLI installed and authenticated to your Azure subscription.

## Usage

Below is an example of how to use this module in your Terraform configuration:

```hcl
module "azure_network_infrastructure" {
  source = "./path/to/this/module"

  azurerm_resource_group_name   = "my-resource-group"
  azurerm_resource_group_location = "East US"
  virtual_network_name          = "my-vnet"
  virtual_network_location     = "East US"
  virtual_network_addres_space = "10.0.0.0/16"

  subnets_name = ["subnet-1", "subnet-2"]
  subnets_address_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
}
```

## Inputs

| Name                         | Type           | Description                                                             | Default             | Required |
|------------------------------|----------------|-------------------------------------------------------------------------|---------------------|----------|
| `azurerm_resource_group_name` | `string`       | The name of the resource group to create.                                | `null`              | Yes      |
| `azurerm_resource_group_location` | `string`       | The Azure location for the resource group.                               | `null`              | Yes      |
| `virtual_network_name`        | `string`       | The name of the virtual network to create.                               | `null`              | Yes      |
| `virtual_network_location`    | `string`       | The location where the virtual network will be created.                  | `null`              | Yes      |
| `virtual_network_addres_space` | `string`     | The address space for the virtual network (CIDR block).                  | `null`              | Yes      |
| `subnets_name`                | `list(string)` | A list of subnet names to create within the virtual network.             | `null`              | Yes      |
| `subnets_address_prefixes`    | `list(string)` | A list of address prefixes for the subnets in CIDR notation.             | `null`              | Yes      |

## Outputs

| Name                              | Description                                                  |
|-----------------------------------|--------------------------------------------------------------|
| `subnets_id`                      | The IDs of the created subnets.                              |
| `subnets_name`                    | The names of the created subnets.                            |
| `resource_group_name`             | The name of the created resource group.                      |
| `virtual_network_name`            | The name of the created virtual network.                     |
| `azurerm_resource_group_location` | The location of the created resource group.                  |

## Steps to Deploy

1. Clone this repository or copy the module into your Terraform configuration.
2. Update the input values in the example configuration to match your environment.
3. Run the following commands:

   ```bash
   terraform init       # Initialize the Terraform working directory
   terraform plan       # Preview the changes Terraform will make
   terraform apply      # Apply the changes to create the resources
   ```

4. Verify the resources are created in the Azure portal.

## Notes

- Ensure the resource group and virtual network names are unique in your Azure subscription.
- Subnet names and address prefixes must match in length (i.e., the number of subnets and the number of address prefixes should be equal).

## License

This project is licensed under the MIT License.
