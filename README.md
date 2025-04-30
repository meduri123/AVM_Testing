# AVM_Testing
<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Admin password for the VM | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Admin username for the VM | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region. | `string` | n/a | yes |
| <a name="input_nsg_names"></a> [nsg\_names](#input\_nsg\_names) | n/a | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `string` | n/a | yes |
| <a name="input_security_rules"></a> [security\_rules](#input\_security\_rules) | n/a | <pre>map(object({<br/>    access                                     = string<br/>    description                                = optional(string)<br/>    destination_address_prefix                 = optional(string)<br/>    destination_address_prefixes               = optional(set(string))<br/>    destination_application_security_group_ids = optional(set(string))<br/>    destination_port_range                     = optional(string)<br/>    destination_port_ranges                    = optional(set(string))<br/>    direction                                  = string<br/>    name                                       = string<br/>    priority                                   = number<br/>    protocol                                   = string<br/>    source_address_prefix                      = optional(string)<br/>    source_address_prefixes                    = optional(set(string))<br/>    source_application_security_group_ids      = optional(set(string))<br/>    source_port_range                          = optional(string)<br/>    source_port_ranges                         = optional(set(string))<br/>    timeouts = optional(object({<br/>      create = optional(string)<br/>      delete = optional(string)<br/>      read   = optional(string)<br/>      update = optional(string)<br/>    }))<br/>  }))</pre> | n/a | yes |
| <a name="input_source_image_reference"></a> [source\_image\_reference](#input\_source\_image\_reference) | Source image reference for the VM | <pre>object({<br/>    publisher = string<br/>    offer     = string<br/>    sku       = string<br/>    version   = string<br/>  })</pre> | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the virtual machine | `string` | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space for the virtual network. | `list(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name for the virtual network. | `string` | n/a | yes |
| <a name="input_vnet_subnets"></a> [vnet\_subnets](#input\_vnet\_subnets) | n/a | <pre>map(object({<br/>    name           = string<br/>    address_prefix = string<br/>    network_security_group = string<br/>  }))</pre> | n/a | yes |
| <a name="input_asg_names"></a> [asg\_names](#input\_asg\_names) | A map of application security group names. | `map(string)` | `{}` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability zone for the VM | `string` | `null` | no |
| <a name="input_disable_password_auth"></a> [disable\_password\_auth](#input\_disable\_password\_auth) | Disable password authentication for the VM | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to the resources. | `map(string)` | `{}` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size of the virtual machine | `string` | `"Standard_D2ds_v5"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_subnet_id"></a> [app\_subnet\_id](#output\_app\_subnet\_id) | n/a |
| <a name="output_db_subnet_id"></a> [db\_subnet\_id](#output\_db\_subnet\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
<!-- END_TF_DOCS -->