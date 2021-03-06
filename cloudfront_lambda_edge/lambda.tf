module "lambda_at_edge" {
  source = "terraform-aws-modules/lambda/aws"

  lambda_at_edge = true

  function_name = "lambda_at_edge"
  description   = "Demo lambda@edge function"
  handler       = "index.handler"
  runtime       = "nodejs14.x"

  source_path = "src/index.js"

  tags = merge(
    {
      "lambda_at_edge" = "true"
    },
    local.tags
  )
}