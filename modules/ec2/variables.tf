variable "project_name" {
  description = "Name of Project"
  type = string
}

variable "environment" {
  description = "Environment Type"
  type = string
}

variable "image_id" {
  description = "Image ID"
  type = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type = string
}

variable "app_security_group" {
  description = "Application Security Group"
  type = string
}

variable "name_prefix" {
  description = "Name of Launch Template"
  type    = string
}

variable "key_name" {
  description = "Name of the Private Key to be used for the EC2 Instance"
  type = string
}

variable "private_key_path" {
  description = "Path to the Private Key to be used for the EC2 Instance"
  type = string
}

variable "connection_type" {
  description = "The type of connection used for the EC2 Instance"
  type = string
}

variable "connection_user" {
  description = "EC2 User"
  type = string
}

variable "connection_host" {
  description = "Allows connection to the newly created EC2 Instances"
  type = string
}

variable "volume_size" {
  description = "Size of the EBS Volume"
  type = number
}

variable "volume_type" {
  description = "Type of EBS Volume"
  type = string
  validation {
    condition = can(regex("gp2|gp3", var.volume_type))
    error_message = "Volume Type must be one of gp2, gp3"
  }
}