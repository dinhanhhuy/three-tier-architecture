resource "null_resource" "delete_key_pair" {
  triggers = {
    key_name = var.key_name
    private_key = var.private_key
  }

  provisioner "local-exec" {
    when    = destroy
    on_failure = continue
    command = "test -f ${self.triggers.private_key} && rm -f ${self.triggers.private_key} && aws ec2 delete-key-pair --key-name ${self.triggers.key_name} || echo 'No key to delete'"
  }
}

resource "null_resource" "create_key_pair" {
  triggers = {
    key_name = var.key_name
    private_key = var.private_key
  }

  provisioner "local-exec" {
    when = create
    on_failure = fail
    command = "test -f ${self.triggers.private_key} || aws ec2 create-key-pair --key-name ${self.triggers.key_name} --query 'KeyMaterial' --output text > ${self.triggers.private_key} && chmod 400 ${self.triggers.private_key}"
  }
}