# fetch ubuntu ami id:
data "aws_ami" "ubuntu_ami" {
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  most_recent = true
  owners      = ["099720109477"]
}

# generate user data script :
data "template_cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content      = <<-EOT
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    echo "<h1>Deployed to AWS EC2 via Terraform </h1>" | sudo tee /var/www/html/index.html
    
    EOT
  }
}