locals {
  required_tags = {
    Project     = var.project_name,
    Environment = var.environment
  }

  private_key_path = var.private_key_path
}