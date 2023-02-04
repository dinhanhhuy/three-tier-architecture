provider "aws" {
  region = var.region
}

module "ec2" {
  source                 = "./modules/ec2"
  project_name           = var.project_name
  environment            = var.environment
  image_id               = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = module.security.vpc_security_group_ids
  id_app                 = var.id_app
  name_prefix            = var.name_prefix
}

module "vpc" {
  source                      = "./modules/vpc"
  project_name                = var.project_name
  environment                 = var.environment
  vpc_id                      = var.vpc_id
  vpc_cidr                    = var.vpc_cidr
  availability_zones          = var.availability_zones
  route_table_id              = var.route_table_id
  gateway_id                  = var.gateway_id
  destination_cidr_block      = var.destination_cidr_block
  aws_subnet_public_subnet    = var.aws_subnet_public_subnet
  aws_subnet_private_subnet   = var.aws_subnet_private_subnet
  load_balancer_type          = var.load_balancer_type
  id_app                      = module.ec2.id_app
  security_group_alb_app_http = module.security.security_group_alb_app_http
  subnet_id                   = var.subnet_id
  az_public_subnet            = var.public_subnet
  az_private_subnet           = var.private_subnet
  az_database_subnet          = var.database_subnet
  app_alb_lb                  = var.app_alb_lb
  app_target_group            = var.app_target_group
  app_autoscaling_group       = var.app_autoscaling_group
  database_subnet_group       = var.database_subnet_group
  alb_app_security_group      = var.alb_app_security_group
  app_instance_security_group = var.app_instance_security_group
  db_security_group           = var.db_security_group
  cidr_blocks                 = var.cidr_blocks
}

module "rds" {
  source                               = "./modules/rds"
  project_name                         = var.project_name
  environment                          = var.environment
  engine_name                          = var.engine_name
  engine_version                       = var.engine_version
  storage                              = var.storage
  aws_db_subnet_group_db_subnet        = module.vpc.aws_db_subnet_group_db_subnet_group
  identifier                           = var.identifier
  instance_class                       = var.instance_class
  multi_az                             = var.multi_az
  database_name                        = var.database_name
  database_username                    = var.database_username
  database_password                    = var.database_password
  database_port                        = var.database_port
  publicly_accessible                  = var.publicly_accessible
  aws_security_group_db_security_group = module.security.aws_security_group_db_sg
  database_snapshot                    = var.database_snapshot
}
