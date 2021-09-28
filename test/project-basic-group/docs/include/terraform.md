<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.14 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | >=3.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 3.7.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_main"></a> [main](#module\_main) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [gitlab_group.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/data-sources/group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | description of project. | `string` | `""` | no |
| <a name="input_gitlab_token"></a> [gitlab\_token](#input\_gitlab\_token) | token gitlab | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | The path of the group. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the project. | `string` | n/a | yes |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | The visibility of the project private or public. | `string` | `"private"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->