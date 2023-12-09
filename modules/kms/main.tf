resource "aws_kms_key" "ebs_kms_key" {
  description             = "KMS key for encrypting EBS volumes"
  deletion_window_in_days = var.ebs_kms_key_deletion_window_in_days
  enable_key_rotation     = var.ebs_kms_key_rotation
  policy                  = var.ebs_kms_key_policy

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}
