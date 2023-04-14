<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.50 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_terraform_remote_state"></a> [terraform\_remote\_state](#module\_terraform\_remote\_state) | ./module/remote-state | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | The name of the DynamoDB table to use for state locking. | `string` | n/a | yes |
| <a name="input_enable_replication"></a> [enable\_replication](#input\_enable\_replication) | Set this to true to enable S3 bucket replication in another region | `bool` | `false` | no |
| <a name="input_iam_policy_attachment_name"></a> [iam\_policy\_attachment\_name](#input\_iam\_policy\_attachment\_name) | The name of the attachment. | `string` | `"tw-tf-iam-role-attachment-replication-configuration"` | no |
| <a name="input_iam_policy_name_prefix"></a> [iam\_policy\_name\_prefix](#input\_iam\_policy\_name\_prefix) | Creates a unique name beginning with the specified prefix. | `string` | `"tw-tf-remote-state-replication-policy"` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | Use IAM role of specified ARN for s3 replication instead of creating it. | `string` | `null` | no |
| <a name="input_iam_role_name_prefix"></a> [iam\_role\_name\_prefix](#input\_iam\_role\_name\_prefix) | Creates a unique name beginning with the specified prefix. | `string` | `"tw-tf-remote-state-replication-role"` | no |
| <a name="input_kms_key_alias"></a> [kms\_key\_alias](#input\_kms\_key\_alias) | The alias for the KMS key as viewed in AWS console. It will be automatically prefixed with `alias/` | `string` | n/a | yes |
| <a name="input_kms_key_deletion_window_in_days"></a> [kms\_key\_deletion\_window\_in\_days](#input\_kms\_key\_deletion\_window\_in\_days) | Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. | `number` | `30` | no |
| <a name="input_kms_key_enable_key_rotation"></a> [kms\_key\_enable\_key\_rotation](#input\_kms\_key\_enable\_key\_rotation) | Specifies whether key rotation is enabled. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region in which resources are set up. | `string` | n/a | yes |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | If override\_s3\_bucket\_name is true, use this bucket name instead of dynamic name with bucket\_prefix | `string` | `""` | no |
| <a name="input_s3_bucket_name_replica"></a> [s3\_bucket\_name\_replica](#input\_s3\_bucket\_name\_replica) | If override\_s3\_bucket\_name is true, use this bucket name for replica instead of dynamic name with bucket\_prefix | `string` | `""` | no |
| <a name="input_state_bucket_prefix"></a> [state\_bucket\_prefix](#input\_state\_bucket\_prefix) | Creates a unique state bucket name beginning with the specified prefix. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resources. | `map(string)` | <pre>{<br>  "Terraform": "true"<br>}</pre> | no |
| <a name="input_terraform_iam_policy_create"></a> [terraform\_iam\_policy\_create](#input\_terraform\_iam\_policy\_create) | Specifies whether to terraform IAM policy is created. | `bool` | `true` | no |
| <a name="input_terraform_iam_policy_name_prefix"></a> [terraform\_iam\_policy\_name\_prefix](#input\_terraform\_iam\_policy\_name\_prefix) | Creates a unique name beginning with the specified prefix. | `string` | `"tw-terraform"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_key"></a> [kms\_key](#output\_kms\_key) | The KMS customer master key to encrypt state buckets. |
| <a name="output_state_bucket"></a> [state\_bucket](#output\_state\_bucket) | The S3 bucket to store the remote state file. |
<!-- END_TF_DOCS -->
