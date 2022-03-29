#Provider variables
variable "region" {
    type = string
    default = "us-east-1"
}

variable "profile" {
    type = string
    default = "master"
}

variable "access_key" {
    type = string
}

variable "secret_key" {
    type = string
}

variable "es_domain_name" {
    type = string
    default = "master"
}

variable "es_version" {
    type = string
    default = "7.10"  
}

#Networking variables
variable "vpc_name" {
    type = string
    default = "zenpli-staging-vpc"
}

variable "vpc_cidr_block" {
    type = string
    default = "10.30.0.0/16"
}

variable "vpc_azs" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_private_subnets" {
    type = list(string)
    default = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
}

variable "vpc_public_subnets" {
    type = list(string)
    default = ["10.30.101.0/24", "10.30.102.0/24", "10.30.103.0/24"]
}

variable "vpc_database_subnets" {
    type = list(string)
    default = ["10.30.51.0/24", "10.30.52.0/24","10.30.53.0/24"]
}

# EC2 Variables

variable "bastion_key" {
    type = string
    default = "zenpli-staging-bastion"
}

variable "bastion_ami" {
    type = string
    default = "ami-0e1d30f2c40c4c701"
}
