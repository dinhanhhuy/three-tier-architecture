# Create a key pair and save the private key to local 
resource "null_resource" "create_key_pair" {
  triggers = {
    key_name    = var.key_name
    private_key = var.private_key
  }

  provisioner "local-exec" {
    when       = create
    on_failure = fail
    command    = "test -f ${self.triggers.private_key} || aws ec2 create-key-pair --key-name ${self.triggers.key_name} --query 'KeyMaterial' --output text > ${self.triggers.private_key} && chmod 400 ${self.triggers.private_key}"
  }
}


# Save the private key in Secrets Manager
resource "aws_secretsmanager_secret_version" "ec2-private-key-main" {
  secret_id     = var.key_name
  secret_string = file(var.private_key)

  depends_on = [
    null_resource.create_key_pair
  ]
}

# remove the private key from local
resource "null_resource" "delete_key_pair" {
  triggers = {
    key_name    = var.key_name
    private_key = var.private_key
  }

  provisioner "local-exec" {
    when       = destroy
    command = "test -f ${self.triggers.private_key} && rm -f ${self.triggers.private_key} && aws ec2 delete-key-pair --key-name ${self.triggers.key_name} || echo 'No key to delete'"
  }
}
