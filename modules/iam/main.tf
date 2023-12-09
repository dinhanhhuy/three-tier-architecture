# SSM Role
resource "aws_iam_role" "ssm_role" {
  name = "SSMRole"

  # Allow SSM to assume this role
  assume_role_policy = data.aws_iam_policy_document.ssm_assume_role_policy.json
}

# Attach SSM policy to SSM role
resource "aws_iam_role_policy_attachment" "ssm_policy_attachment" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Create an instance profile for SSM
resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "SSMInstanceProfile"
  role = aws_iam_role.ssm_role.name
}
