variable "target" {
  type = string
  default = ""
  description = "target"
}

variable "ami_id" {
  type = string
  default = "ami-0ca05c6eaa4ac40e0"
  description = "ami version"
}

variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "aws region"
  
}

variable "key_name" {
    type = string
    default = ""
}

# ----------------------------------------------------- VPC variables --------------------------------------------------------

variable "vpc-names" {
  type = map(string)
  default = {
    "dev" = "vpc-new-dev"
  }
}

variable "cidr" {
  type = map(string)
  default = {
    "dev" = "10.0.0.0/16"
  }
}

variable "azs" {
  type = map(any)
  default = {
    dev = ["us-west-2a", "us-west-2b"]
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    dev = ["10.0.1.0/24", "10.0.2.0/24"]
  }
}

variable "database_subnets" {
  type = map(any)
  default = {
    dev = ["10.0.3.0/24", "10.0.4.0/24"]
  }
}

variable "public_subnets" {
  type = map(any)
  default = {
    dev = ["10.0.102.0/24", "10.0.103.0/24"]
  }
}