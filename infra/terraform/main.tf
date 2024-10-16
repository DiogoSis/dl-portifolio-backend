terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }

  backend "s3" {
    bucket = "dl-portifolio-backend"
    key    = "aws-vm/terraform.tfstate"
    region = var.aws_region
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      owner      = "diogo-luna"
      managed-by = "terraform"
    }
  }
}

module "lambda" {
    source = "./lambda"
}
module "dynamodb" {
    source = "./dynamodb"
}