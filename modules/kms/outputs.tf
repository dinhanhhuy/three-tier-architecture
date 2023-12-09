output "ebs_kms_key_arn" {
    value = aws_kms_key.ebs_kms_key.arn
    description = "KMS key ARN for encrypting EBS volumes"
}