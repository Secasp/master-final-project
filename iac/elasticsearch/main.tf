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

module "aws_es" {

  source = "lgallard/elasticsearch/aws"

  domain_name           = var.es_domain_name
  elasticsearch_version = var.es_version

  cluster_config = {
    dedicated_master_enabled = "true"
    cluster_config_dedicated_master_count = 2
    cluster_config_dedicated_master_type = "t3.small.elasticsearch"
    instance_count           = "2"
    instance_type            = "t3.small.elasticsearch"
    zone_awareness_enabled   = "true"
    availability_zone_count  = "2"
  }

  ebs_options = {
    ebs_enabled = "true"
    volume_size = "10"
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  node_to_node_encryption_enabled                = "true"

  timeouts_update = "60m"

  tags = {
    environment   = "production"
  }
}