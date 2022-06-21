terraform {
  required_version = ">= 1.0.8"
  required_providers {
    aws = {
      version = ">= 4.15.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

# use separate provider for Lambda@Edge
provider "aws" {
  region = var.region_edge
  alias  = "lambda_edge"
}