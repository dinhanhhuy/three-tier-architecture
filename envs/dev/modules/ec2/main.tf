locals {
  required_tags = {
    project     = var.project_name,
    environment = var.environment
  }
}

resource "null_resource" "delete_key_pair" {
  triggers = {
    key_name = var.key_name
  }

  provisioner "local-exec" {
    when    = destroy
    command = "test -f ./${self.triggers.key_name}.pem && rm -f ${self.triggers.key_name}.pem && aws ec2 delete-key-pair --key-name ${self.triggers.key_name} || echo 'No key to delete'"
  }
}

resource "null_resource" "create_key_pair" {
  triggers = {
    key_name = var.key_name
  }

  provisioner "local-exec" {
    on_failure = fail
    when = create
    command = "test -f ./${self.triggers.key_name}.pem || aws ec2 create-key-pair --key-name ${self.triggers.key_name} --query 'KeyMaterial' --output text > ${self.triggers.key_name}.pem && chmod 400 ${self.triggers.key_name}.pem"
  }
}

# App - Launch Template
resource "aws_launch_template" "main" {
  name_prefix            = var.name_prefix
  image_id               = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.app_security_group]
  user_data              = filebase64("./modules/ec2/install.sh")
  key_name = var.key_name

  connection {
    type  = var.connection_type
    user  = var.connection_user
    #private_key is created within AWS EC2 Console, .pem file placed in same directory as .tf
    private_key = file("./${var.key_name}.pem")
    host = var.connection_host
   }

  tags = local.required_tags

  depends_on = [ null_resource.create_key_pair ]
}
