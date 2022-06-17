# create launch configuration for ASG :

resource "aws_launch_configuration" "asg_launch_conf" {
  name_prefix   = "tf-cloufront-alb-demo-"
  image_id      = data.aws_ami.ubuntu_ami.id
  instance_type = "t2.micro"
  user_data     = data.template_cloudinit_config.user_data.rendered

  lifecycle {
    create_before_destroy = true
  }
}

# create ASG with Launch Configuration :
resource "aws_autoscaling_group" "asg" {
  name                 = "tf-cloudfront-alb-asg"
  launch_configuration = aws_launch_configuration.asg_launch_conf.name
  min_size             = 3
  max_size             = 10
  vpc_zone_identifier  = module.vpc.private_subnets # placing asg in private subnet
  target_group_arns    = [aws_lb_target_group.alb_tg.arn]

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    module.vpc,
    aws_lb_target_group.alb_tg,
    aws_launch_configuration.asg_launch_conf
  ]
}
