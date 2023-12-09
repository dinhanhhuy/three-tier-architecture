variable "project_name" {
  description = "Name of Project"
  type = string
}

variable "environment" {
  description = "Environment Type"
  type = string
}

variable "ebs_kms_key_policy" {
  description = "KMS policy for encrypting EBS volumes"
  type = string
}     

variable "ebs_kms_key_rotation" {
  description = "KMS key rotation"
  type = bool
}

variable "ebs_kms_key_deletion_window_in_days" {
  description = "KMS key deletion window in days"
  type = number
}