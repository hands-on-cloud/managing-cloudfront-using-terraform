# data source to generate bucket policy to let OAI get objects:
data "aws_iam_policy_document" "bucket_policy_document" {
  statement {
    actions = ["s3:GetObject"]

    resources = [
      aws_s3_bucket.bucket.arn,
      "${aws_s3_bucket.bucket.arn}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.oai.iam_arn]
    }
  }
}

# data source to fetch hosted zone info from domain name:
data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}