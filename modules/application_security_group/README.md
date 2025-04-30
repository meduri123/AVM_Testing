<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the application security group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to the application security group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_security_group_id"></a> [application\_security\_group\_id](#output\_application\_security\_group\_id) | The ID of the application security group. |
| <a name="output_application_security_group_name"></a> [application\_security\_group\_name](#output\_application\_security\_group\_name) | The name of the application security group. |
<!-- END_TF_DOCS -->