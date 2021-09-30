provider "aws" {
  region  = "us-east-2"
}

terraform {
  required_providers {
    aws = {
      version = "~> 3.60.0"
    }
    template = {
      version = ">= 2.2.0"
    }
  }

  required_version = "~> 0.14.11"
}