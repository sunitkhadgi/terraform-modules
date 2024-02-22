terraform {
  required_version = "~> 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33.0"
    }
  }
  backend "s3" {
  }
}



provider "aws" {
  region                = var.region
  allowed_account_ids   = [var.aws_account_id]
}



module "lightsailinstanceone" {
  source                = "../../modules/lightsail_instance"
  instance_name         = "my-first-instance"
  bundle_id             = "micro_3_0"
  blueprint_id          = "ubuntu_22_04"
  availability_zone     = "us-east-1a"
  associate_elastic_ip  = true
  env                   = "dev"
  instance_tags = {
    Name        = "my-first-instance"
    Environment = "dev"
  }
  # sg_name = "test1"
  # sg_create = true
  #   ingress_rules = [
  #   {
  #     protocol    = "tcp"
  #     from_port   = 22
  #     to_port     = 22
  #     cidr_blocks = ["0.0.0.0/0"]
  #   },
  #   {
  #     protocol    = "tcp"
  #     from_port   = 80
  #     to_port     = 80
  #     cidr_blocks = ["0.0.0.0/0"]
  #   },
  #   {
  #     protocol    = "tcp"
  #     from_port   = 443
  #     to_port     = 443
  #     cidr_blocks = ["0.0.0.0/0"]
  #   },
    # Add more ingress rules as needed
  # ]




  # instance_security_group = [
  #   {
  #     name        = "instance1"
  #     description = "Security group for instance1"
  #     ingress_rules = [
  #       {
  #         protocol    = "tcp"
  #         from_port   = 22
  #         to_port     = 22
  #         cidr_blocks = ["0.0.0.0/0"]
  #       },
  #       {
  #         protocol    = "tcp"
  #         from_port   = 80
  #         to_port     = 80
  #         cidr_blocks = ["0.0.0.0/0"]
  #       },
  #       # Add more ingress rules as needed for instance1
  #     ]
  #   }
  # ]
}

module "lightsailinstancetwo" {
  source                = "../../modules/lightsail_instance"
  instance_name         = "my-second-instance"
  bundle_id             = "micro_3_0"
  blueprint_id          = "ubuntu_22_04"
  availability_zone     = "us-east-1a"
  associate_elastic_ip  = false
  env                   = "prod"
  instance_tags = {
    Name        = "my-first-instance"
    Environment = "prod"
  }  
  # sg_name = "test2"

  #   ingress_rules = [
  #   {
  #     protocol    = "tcp"
  #     from_port   = 22
  #     to_port     = 22
  #     cidr_blocks = ["0.0.0.0/0"]
  #   },
  #   {
  #     protocol    = "tcp"
  #     from_port   = 80
  #     to_port     = 80
  #     cidr_blocks = ["0.0.0.0/0"]
  #   },
  #   # Add more ingress rules as needed
  # ]
}


