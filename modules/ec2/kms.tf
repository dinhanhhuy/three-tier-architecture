resource "aws_kms_key" "ec2_kms_key" {
  description             = "KMS key for encrypting EBS volumes"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  policy                  = data.aws_iam_policy_document.kms_policy.json
}