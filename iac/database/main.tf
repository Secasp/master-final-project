terraform {
  required_providers {
    aws = {
      version = "~> 4.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  profile =  var.profile
}

resource "random_password" "demo_master_password" {
  length = 15
}

module "master_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "master_sg"
  description = "Complete MySQL example security group"
  vpc_id      = "vpc-00d018009b0083de7"

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = "172.31.0.0/16"
    },
  ]

}

module "demo" {
    source = "terraform-aws-modules/rds/aws"

    identifier = "master"

    create_db_option_group    = false
    create_db_parameter_group = false

    engine               = "mysql"
    engine_version       = "8.0.27"
    family               = "mysql8.0"
    major_engine_version = "8.0"
    instance_class       = "db.t2.micro"
    publicly_accessible  = "true"
    storage_encrypted    = "false"
    deletion_protection  = "false"
    
    allocated_storage = 10

    db_name  = "master"
    username = "master"
    port     = 3306
    password = random_password.demo_master_password.result

    vpc_security_group_ids = [module.master_sg.security_group_id]

    tags = {
        environment = "master"
    }
}
