# creating sg for ec2 instance :
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow port 80 for HTTP"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  tags = local.tags
}

# creating ec2 instance :
resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.ubuntu_ami.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = data.template_cloudinit_config.user_data.rendered
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]

  tags = merge(local.tags, {
    Name = "ec2-cloudfront"
  })
}