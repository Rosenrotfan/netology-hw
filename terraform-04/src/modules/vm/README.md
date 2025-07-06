## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.12.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_instance.vm](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |
| [template_file.cloud_init](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [yandex_compute_image.ubuntu](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | Project label (marketing/analytics) | `string` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH public key | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID подсети | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | VM name | `string` | n/a | yes |
| <a name="input_vm_os_family"></a> [vm\_os\_family](#input\_vm\_os\_family) | Тип ос | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_vms_resources"></a> [vms\_resources](#input\_vms\_resources) | n/a | <pre>map(object({<br/>    cores         = number<br/>    memory        = number<br/>    core_fraction = number<br/>    plat          = string<br/>    zone          = string<br/>    count         = number<br/>  }))</pre> | <pre>{<br/>  "vm": {<br/>    "core_fraction": 5,<br/>    "cores": 2,<br/>    "count": 1,<br/>    "memory": 2,<br/>    "plat": "standard-v2",<br/>    "zone": "ru-central1-a"<br/>  }<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ips"></a> [external\_ips](#output\_external\_ips) | n/a |
