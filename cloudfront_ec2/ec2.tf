# creating ec2 instance :
resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.ubuntu_ami.id
  instance_type               = "t2.micro"
  user_data                   = data.template_cloudinit_config.user_data.rendered
  
  
  tags = merge(local.tags, {
    Name = "ec2-cloudfront"
  })
}