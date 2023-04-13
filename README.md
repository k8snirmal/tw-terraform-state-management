<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.50 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.62.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_terraform_remote_state"></a> [terraform\_remote\_state](#module\_terraform\_remote\_state) | ./module/remote-state | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_user.terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.remote_state_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dynamodb_enable_server_side_encryption"></a> [dynamodb\_enable\_server\_side\_encryption](#input\_dynamodb\_enable\_server\_side\_encryption) | Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK) | `bool` | `false` | no |
| <a name="input_dynamodb_table_billing_mode"></a> [dynamodb\_table\_billing\_mode](#input\_dynamodb\_table\_billing\_mode) | Controls how you are charged for read and write throughput and how you manage capacity. | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | The name of the DynamoDB table to use for state locking. | `string` | n/a | yes |
| <a name="input_enable_replication"></a> [enable\_replication](#input\_enable\_replication) | Set this to true to enable S3 bucket replication in another region | `bool` | `false` | no |
| <a name="input_iam_policy_attachment_name"></a> [iam\_policy\_attachment\_name](#input\_iam\_policy\_attachment\_name) | The name of the attachment. | `string` | `"tw-tf-iam-role-attachment-replication-configuration"` | no |
| <a name="input_iam_policy_name"></a> [iam\_policy\_name](#input\_iam\_policy\_name) | If override\_iam\_policy\_name is true, use this policy name instead of dynamic name with policy\_prefix | `string` | `""` | no |
| <a name="input_iam_policy_name_prefix"></a> [iam\_policy\_name\_prefix](#input\_iam\_policy\_name\_prefix) | Creates a unique name beginning with the specified prefix. | `string` | `"tw-tf-remote-state-replication-policy"` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | Use IAM role of specified ARN for s3 replication instead of creating it. | `string` | `null` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | If override\_iam\_role\_name is true, use this role name instead of dynamic name with role\_prefix | `string` | `""` | no |
| <a name="input_iam_role_name_prefix"></a> [iam\_role\_name\_prefix](#input\_iam\_role\_name\_prefix) | Creates a unique name beginning with the specified prefix. | `string` | `"tw-tf-remote-state-replication-role"` | no |
| <a name="input_iam_role_permissions_boundary"></a> [iam\_role\_permissions\_boundary](#input\_iam\_role\_permissions\_boundary) | Use permissions\_boundary with the replication IAM role. | `string` | `null` | no |
| <a name="input_kms_key_alias"></a> [kms\_key\_alias](#input\_kms\_key\_alias) | The alias for the KMS key as viewed in AWS console. It will be automatically prefixed with `alias/` | `string` | n/a | yes |
| <a name="input_kms_key_deletion_window_in_days"></a> [kms\_key\_deletion\_window\_in\_days](#input\_kms\_key\_deletion\_window\_in\_days) | Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. | `number` | `30` | no |
| <a name="input_kms_key_description"></a> [kms\_key\_description](#input\_kms\_key\_description) | The description of the key as viewed in AWS console. | `string` | `"The key used to encrypt the remote state bucket."` | no |
| <a name="input_kms_key_enable_key_rotation"></a> [kms\_key\_enable\_key\_rotation](#input\_kms\_key\_enable\_key\_rotation) | Specifies whether key rotation is enabled. | `bool` | `true` | no |
| <a name="input_noncurrent_version_expiration"></a> [noncurrent\_version\_expiration](#input\_noncurrent\_version\_expiration) | Specifies when noncurrent object versions expire. See the aws\_s3\_bucket document for detail. | <pre>object({<br>    days = number<br>  })</pre> | `null` | no |
| <a name="input_noncurrent_version_transitions"></a> [noncurrent\_version\_transitions](#input\_noncurrent\_version\_transitions) | Specifies when noncurrent object versions transitions. See the aws\_s3\_bucket document for detail. | <pre>list(object({<br>    days          = number<br>    storage_class = string<br>  }))</pre> | <pre>[<br>  {<br>    "days": 7,<br>    "storage_class": "GLACIER"<br>  }<br>]</pre> | no |
| <a name="input_override_iam_policy_name"></a> [override\_iam\_policy\_name](#input\_override\_iam\_policy\_name) | override iam policy name to disable policy\_prefix and create policy with static name | `bool` | `false` | no |
| <a name="input_override_iam_role_name"></a> [override\_iam\_role\_name](#input\_override\_iam\_role\_name) | override iam role name to disable role\_prefix and create role with static name | `bool` | `false` | no |
| <a name="input_override_s3_bucket_name"></a> [override\_s3\_bucket\_name](#input\_override\_s3\_bucket\_name) | override s3 bucket name to disable bucket\_prefix and create bucket with static name | `bool` | `false` | no |
| <a name="input_override_terraform_iam_policy_name"></a> [override\_terraform\_iam\_policy\_name](#input\_override\_terraform\_iam\_policy\_name) | override terraform iam policy name to disable policy\_prefix and create policy with static name | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region in which resources are set up. | `string` | n/a | yes |
| <a name="input_s3_bucket_force_destroy"></a> [s3\_bucket\_force\_destroy](#input\_s3\_bucket\_force\_destroy) | A boolean that indicates all objects should be deleted from S3 buckets so that the buckets can be destroyed without error. These objects are not recoverable. | `bool` | `false` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | If override\_s3\_bucket\_name is true, use this bucket name instead of dynamic name with bucket\_prefix | `string` | `""` | no |
| <a name="input_s3_bucket_name_replica"></a> [s3\_bucket\_name\_replica](#input\_s3\_bucket\_name\_replica) | If override\_s3\_bucket\_name is true, use this bucket name for replica instead of dynamic name with bucket\_prefix | `string` | `""` | no |
| <a name="input_s3_logging_target_bucket"></a> [s3\_logging\_target\_bucket](#input\_s3\_logging\_target\_bucket) | The name of the bucket for log storage. The "S3 log delivery group" should have Objects-write und ACL-read permissions on the bucket. | `string` | `null` | no |
| <a name="input_s3_logging_target_prefix"></a> [s3\_logging\_target\_prefix](#input\_s3\_logging\_target\_prefix) | The prefix to apply on bucket logs, e.g "logs/". | `string` | `""` | no |
| <a name="input_state_bucket_prefix"></a> [state\_bucket\_prefix](#input\_state\_bucket\_prefix) | Creates a unique state bucket name beginning with the specified prefix. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resources. | `map(string)` | <pre>{<br>  "Terraform": "true"<br>}</pre> | no |
| <a name="input_terraform_iam_policy_create"></a> [terraform\_iam\_policy\_create](#input\_terraform\_iam\_policy\_create) | Specifies whether to terraform IAM policy is created. | `bool` | `true` | no |
| <a name="input_terraform_iam_policy_name"></a> [terraform\_iam\_policy\_name](#input\_terraform\_iam\_policy\_name) | If override\_terraform\_iam\_policy\_name is true, use this policy name instead of dynamic name with policy\_prefix | `string` | `""` | no |
| <a name="input_terraform_iam_policy_name_prefix"></a> [terraform\_iam\_policy\_name\_prefix](#input\_terraform\_iam\_policy\_name\_prefix) | Creates a unique name beginning with the specified prefix. | `string` | `"tw-terraform"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_key"></a> [kms\_key](#output\_kms\_key) | The KMS customer master key to encrypt state buckets. |
| <a name="output_state_bucket"></a> [state\_bucket](#output\_state\_bucket) | The S3 bucket to store the remote state file. |
<!-- END_TF_DOCS -->
