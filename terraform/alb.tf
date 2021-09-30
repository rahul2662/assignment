module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "assignment-alb"#var.alb_name

  load_balancer_type = "application"#var.alb_type

  vpc_id             = "vpc-20685748" #var.vpc_id
  subnets            = ["subnet-09905445","subnet-03092e6b"] #var.subnet_ids
  security_groups    = [module.alb_sg.security_group_id]

  target_groups = [
    {
      name_prefix      = "hellow"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = module.ec2_instance.id
          port = 80
        }
      ]
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "assignment"
  }
}