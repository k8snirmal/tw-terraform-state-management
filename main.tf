module "terraform_remote_state" {
  source = "./module/remote-state"

  region                           = var.region
  iam_role_name_prefix             = var.iam_role_name_prefix
  terraform_iam_policy_create      = var.terraform_iam_policy_create
  terraform_iam_policy_name_prefix = var.terraform_iam_policy_name_prefix
  kms_key_alias                    = var.kms_key_alias
  kms_key_deletion_window_in_days  = var.kms_key_deletion_window_in_days
  iam_role_arn                     = var.iam_role_arn
  iam_policy_name_prefix           = var.iam_policy_name_prefix
  kms_key_enable_key_rotation      = var.kms_key_enable_key_rotation
  state_bucket_prefix              = var.state_bucket_prefix
  enable_replication               = var.enable_replication
  iam_policy_attachment_name       = var.iam_policy_attachment_name
  dynamodb_table_name              = var.dynamodb_table_name
  tags                             = var.tags
}

resource "aws_iam_user" "terraform" {
  name = "TerraformUser"
}

resource "aws_iam_user_policy_attachment" "remote_state_access" {
  user       = aws_iam_user.terraform.name
  policy_arn = module.terraform_remote_state.terraform_iam_policy.arn
}
