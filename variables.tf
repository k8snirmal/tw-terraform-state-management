################################################
#####          General variables           #####
################################################

variable "tags" {
  description = "A mapping of tags to assign to resources."
  type        = map(string)
  default = {
    Terraform = "true"
  }
}

variable "region" {
  description = "The AWS region in which resources are set up."
  type        = string
}

######################################################################
##### IAM Policy for Executing Terraform with Remote States      #####
######################################################################

variable "terraform_iam_policy_create" {
  description = "Specifies whether to terraform IAM policy is created."
  type        = bool
  default     = true
}

variable "terraform_iam_policy_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
  type        = string
  default     = "tw-terraform"
}

################################################
##### KMS Key for Encrypting S3 Buckets    #####
################################################

variable "kms_key_alias" {
  description = "The alias for the KMS key as viewed in AWS console. It will be automatically prefixed with `alias/`"
  type        = string
}

variable "kms_key_deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days."
  type        = number
  default     = 30
}

variable "kms_key_enable_key_rotation" {
  description = "Specifies whether key rotation is enabled."
  type        = bool
  default     = true
}

################################################
#####         S3 Buckets                   #####
################################################

variable "enable_replication" {
  description = "Set this to true to enable S3 bucket replication in another region"
  type        = bool
  default     = false
}

variable "state_bucket_prefix" {
  description = "Creates a unique state bucket name beginning with the specified prefix."
  type        = string
}

variable "iam_role_arn" {
  description = "Use IAM role of specified ARN for s3 replication instead of creating it."
  type        = string
  default     = null
}

variable "iam_role_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
  type        = string
  default     = "tw-tf-remote-state-replication-role"
}

variable "iam_policy_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
  type        = string
  default     = "tw-tf-remote-state-replication-policy"
}

variable "iam_policy_attachment_name" {
  description = "The name of the attachment."
  type        = string
  default     = "tw-tf-iam-role-attachment-replication-configuration"
}


################################################
#####   DynamoDB Table for State Locking   #####
################################################

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table to use for state locking."
  type        = string
}

#####################################################
##### Optionally specifying a fixed bucket name #####
#####################################################


variable "s3_bucket_name" {
  description = "If override_s3_bucket_name is true, use this bucket name instead of dynamic name with bucket_prefix"
  type        = string
  default     = ""
  validation {
    condition     = length(var.s3_bucket_name) == 0 || length(regexall("^[a-z0-9][a-z0-9\\-.]{1,61}[a-z0-9]$", var.s3_bucket_name)) > 0
    error_message = "Input variable s3_bucket_name is invalid. Please refer to https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html."
  }
}
variable "s3_bucket_name_replica" {
  description = "If override_s3_bucket_name is true, use this bucket name for replica instead of dynamic name with bucket_prefix"
  type        = string
  default     = ""
  validation {
    condition     = length(var.s3_bucket_name_replica) == 0 || length(regexall("^[a-z0-9][a-z0-9\\-.]{1,61}[a-z0-9]$", var.s3_bucket_name_replica)) > 0
    error_message = "Input variable s3_bucket_name_replica is invalid. Please refer to https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html."
  }
}
