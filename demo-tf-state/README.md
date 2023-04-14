
## Instruction to run the terraform  with remote backend created in the previous demo

1) Change directory to demo-tf-state `cd demo-tf-state`

2) Update `candidate_name` in terraform.tfvars with your name.

3) Update  backend.tfvars with `bucket`, `key` and `dynamodb_table` which was created in the previous module.

4) Run `make init` command to initialize working directory by creating initial files, loading any remote state, downloading modules, etc.

5) Run `make plan` to generate a speculative execution plan.

6) Run `make apply` to provision the required resources.

Note: Remember to run `make destory` to delete all the resource created by these module once you are done all activities to avoid charges

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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc.demo_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_candidate_name"></a> [candidate\_name](#input\_candidate\_name) | Enter your name here | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | default region | `string` | `"ap-south-1"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | default vpc\_cidr\_block | `string` | `"172.16.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID of the AWS VPC |
<!-- END_TF_DOCS -->