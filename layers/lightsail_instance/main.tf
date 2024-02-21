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



module "instanceone" {
  source                = "../../modules/lightsail_instance"
  instance_name         = "my-first-instance"
  bundle_id             = "nano_2_0"
  blueprint_id          = "amazon_linux_2"
  #key_pair_name         = "my-key-pair"
  availability_zone     = "us-east-1a"
  associate_elastic_ip  = true
  env                   = "dev"
  instance_tags = {
    Name        = "my-first-instance"
    Environment = "dev"
  }
}

module "instancetwo" {
  source                = "../../modules/lightsail_instance"
  instance_name         = "my-second-instance"
  bundle_id             = "nano_2_0"
  blueprint_id          = "amazon_linux_2"
  availability_zone     = "us-east-1a"
  #key_pair_name         = "my-key-pair"
  associate_elastic_ip  = false
  env                   = "prod"
  instance_tags = {
    Name        = "my-first-instance"
    Environment = "prod"
  }  
}


