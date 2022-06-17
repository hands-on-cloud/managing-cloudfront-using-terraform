# Create ALB :
resource "aws_lb" "alb" {
  name               = "tf-cloudfront-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets

  tags = local.tags

  depends_on = [
    module.vpc
  ]
}

# Create ALB Target Group :
resource "aws_lb_target_group" "alb_tg" {
  name        = "tf-cloudfront-alb-tg"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = module.vpc.id

  depends_on = [
    module.vpc
  ]
}

