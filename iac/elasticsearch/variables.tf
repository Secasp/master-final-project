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

