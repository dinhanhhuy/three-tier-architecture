# App - Launch Template
resource "aws_launch_template" "main" {
  name_prefix = var.name_prefix
  image_id    = var.image_id

  iam_instance_profile {
    arn = var.iam_instance_profile_arn
  }

  instance_type = var.instance_type

  vpc_security_group_ids = [var.app_security_group]
  key_name               = var.key_name

  user_data = var.user_data

  block_device_mappings {
    ebs {
      encrypted   = true
      kms_key_id  = var.ebs_kms_key_arn
      volume_size = var.volume_size
      volume_type = var.volume_type
    }
  }

  connection {
    type        = var.connection_type
    user        = var.connection_user
    private_key = file(var.private_key)
    host        = var.connection_host
  }

  tags = {
    Project     = var.project_name,
    Environment = var.environment
  }

  depends_on = [null_resource.create_key_pair]
}
