variable "region_edge" {
  type        = string
  description = "The AWS Region to use for the Lambda@Edge Function"
  default     = "us-east-1" # no other region allowed for Lambda@Edge
}

variable "region" {
  type        = string
  description = "The AWS Region to use for the other resources"
  default     = "us-west-2" # setting different region for other resources
}

variable "bucket_prefix" {
  type        = string
  description = "The prefix for the S3 bucket"
  default     = "tf-s3-website-"
}

variable "domain_name" {
  type        = string
  description = "The domain name to use"
  default     = "demo.hands-on-cloud.com"
}