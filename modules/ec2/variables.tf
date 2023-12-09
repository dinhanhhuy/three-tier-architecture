variable "project_name" {
  description = "Name of Project"
  type        = string
}

variable "environment" {
  description = "Environment Type"
  type        = string
}

variable "image_id" {
  description = "Image ID"
  type        = string
}

variable "user_data" {
  description = "User Data"
  type        = string
}

variable "iam_instance_profile_arn" {
  description = "IAM Instance Profile ARN"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "volume_size" {
  description = "Size of the EBS Volume"
  type        = number
}

variable "volume_type" {
  description = "Type of EBS Volume"
  type        = string

  validation {
    condition     = var.volume_type == "gp2" || var.volume_type == "gp3"
    error_message = "Volume Type must be gp2 or gp3"
  }
}

variable "app_security_group" {
  description = "Application Security Group"
  type        = string
}

variable "name_prefix" {
  description = "Name of Launch Template"
  type        = string
}

variable "key_name" {
  description = "Name of the Private Key to be used for the EC2 Instance"
  type        = string
}

variable "ebs_kms_key_arn" {
  description = "KMS Key ARN for encrypting EBS volumes"
  type        = string
}

variable "private_key" {
  description = "Path to the Private Key to be used for the EC2 Instance"
  type        = string
}

variable "connection_type" {
  description = "The type of connection used for the EC2 Instance"
  type        = string
}

variable "connection_user" {
  description = "EC2 User"
  type        = string
}

variable "connection_host" {
  description = "Allows connection to the newly created EC2 Instances"
  type        = string
}

