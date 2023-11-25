locals {
  required_tags = {
    Project     = var.project_name,
    Environment = var.environment
  }
}
