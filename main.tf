data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_default_security_group" "ssh_access" {
  vpc_id = module.vpc_bombardier.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


module "vpc_bombardier" {
  source           = "./modules/aws-vpc/"
  name             = var.vpc-names.dev
  cidr             = var.cidr.dev
  azs              = var.azs.dev
  # private_subnets  = var.private_subnets.dev
  public_subnets   = var.public_subnets.dev

  enable_nat_gateway   = true
  enable_vpn_gateway   = false
  enable_dns_hostnames = false

  tags = {
    Terraform   = "true"
  }
}

module "bombardier_acg" {
  source      = "./modules/ddos"

  min_size         = 1
  max_size         = 10
  desired_capacity = 3

  target      = var.target
  ami         = var.ami_id
  aws_subnets = module.vpc_bombardier.public_subnets

  key_name    = var.key_name

  vpc_security_group_ids = [aws_default_security_group.ssh_access.id]
}

