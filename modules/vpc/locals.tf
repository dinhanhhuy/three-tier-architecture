locals {
  required_tags = {
    Project     = var.project_name,
    Environment = var.environment
  }

  ingress_rules = [{
    port        = 80
    description = "Allow HTTP access"
    },
    {
      port        = 443
      description = "Allow HTTPS access"
    },
    {
      port        = 22
      description = "Allow SSH access"
  }]

  rds_ingress_rules = [{
    port        = 3306
    description = "Allow MySQL access"
  }]

  egress_rules = [{
    port        = 0
    description = "Allow all Egress traffic"
  }]
}
