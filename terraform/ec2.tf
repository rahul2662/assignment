data "template_file" "user_data" {
  template = "${file("${path.module}/userdata.tpl")}"
  vars = {
    "app_port" = "80"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "assignment-ec2"

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "assignment"
  monitoring             = false
  vpc_security_group_ids = [module.ec2_sg.security_group_id]
  subnet_id              = "subnet-09905445"
  user_data = data.template_file.user_data.rendered
  tags = {
    Terraform   = "true"
    Environment = "assignment"
  }
}