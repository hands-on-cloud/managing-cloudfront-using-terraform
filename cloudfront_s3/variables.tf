variable "region" {
  type        = string
  description = "The AWS Region to use"
  default     = "us-east-1"
}

variable "bucket_prefix" {
  type        = string
  description = "The prefix for the S3 bucket"
  default     = "tf-s3-website-"
}