# App - Launch Template
resource "aws_launch_template" "main" {
  name_prefix            = var.name_prefix
  image_id               = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.app_security_group]
  user_data              = filebase64("${path.module}/install.sh")
  key_name = var.key_name
  
  block_device_mappings {
    ebs {
      encrypted = true
      kms_key_id = aws_kms_key.ec2_kms_key.arn
      volume_type = var.volume_type
      volume_size = var.volume_size
    }
  }

  connection {
    type  = var.connection_type
    user  = var.connection_user
    private_key = file("${local.key_pair_location}/${var.key_name}.pem")
    host = var.connection_host
   }

  tags = local.required_tags

  depends_on = [ null_resource.create_key_pair ]
}
