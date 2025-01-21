# Network Security Group Terraform Module

This Terraform module creates an Azure Network Security Group (NSG) and its associated security rules.

## Features

- Create a Network Security Group in a specified Azure region and resource group.
- Define a set of security rules with configurable parameters such as priority, direction, access, and port ranges.

## Prerequisites

- Terraform installed on your machine.
- Azure CLI installed and authenticated to your Azure subscription.

## Usage

Below is an example of how to use this module in your Terraform configuration:

```hcl
module "network_security_group" {
  source             = "./path/to/this/module"
  
  nsg_location       = "East US"
  nsg_name           = "my-nsg"
  nsg_resource_group = "my-resource-group"
  
  nsg_security_rule = [
    {
      name                   = "allow-ssh"
      priority               = 1000
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "22"
      source_address_prefix  = "*"
      destination_address_prefix = "*"
    },
    {
      name                   = "allow-http"
      priority               = 1010
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "80"
      source_address_prefix  = "*"
      destination_address_prefix = "*"
    }
  ]
}
```

## Inputs

| Name                   | Type           | Description                                                                                         | Default   | Required |
|------------------------|----------------|-----------------------------------------------------------------------------------------------------|-----------|----------|
| `nsg_location`         | `string`       | The Azure region where the NSG will be created.                                                    | `null`    | Yes      |
| `nsg_name`             | `string`       | The name of the Network Security Group.                                                            | `null`    | Yes      |
| `nsg_resource_group`   | `string`       | The name of the resource group where the NSG will be created.                                       | `null`    | Yes      |
| `nsg_security_rule`    | `list(object)` | A list of security rules to apply to the NSG. See the "Security Rule Structure" section for details.| `[]`      | Yes      |

### Security Rule Structure

Each security rule must follow this structure:

| Attribute                | Type    | Description                                                                                         | Default    | Required |
|--------------------------|---------|-----------------------------------------------------------------------------------------------------|------------|----------|
| `name`                  | `string`| The name of the security rule.                                                                     | `null`     | Yes      |
| `priority`              | `number`| The priority of the rule (100-4096). Lower values are processed first.                             | `null`     | Yes      |
| `direction`             | `string`| The direction of the traffic: `"Inbound"` or `"Outbound"`.                                         | `"Inbound"`| No       |
| `access`                | `string`| Allow or Deny the traffic.                                                                         | `"Deny"`   | No       |
| `protocol`              | `string`| The protocol to allow/deny: `"Tcp"`, `"Udp"`, or `"*"` for all.                                    | `"Tcp"`    | No       |
| `source_port_range`     | `string`| The source port range. Use `"*"` to allow all ports.                                               | `"*"`      | No       |
| `destination_port_range`| `string`| The destination port range. Use `"*"` to allow all ports.                                          | `"*"`      | No       |
| `source_address_prefix` | `string`| The CIDR block of the source address.                                                              | `"*"`      | No       |
| `destination_address_prefix` | `string`| The CIDR block of the destination address.                                                         | `"*"`      | No       |

## Outputs

| Name       | Description                                        |
|------------|----------------------------------------------------|
| `nsg_id`   | The ID of the created Network Security Group.      |
| `nsg_name` | The name of the created Network Security Group.    |

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

- Ensure the provided resource group exists before applying the configuration.
- You can customize the security rules as needed by modifying the `nsg_security_rule` input.


