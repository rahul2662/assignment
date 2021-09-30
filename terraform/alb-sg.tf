module "alb_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "assignment-alb-sg"#var.alb_sg_name
  description = "Security group for alb open to 80 HTTP"
  vpc_id      = "vpc-20685748"#var.vpc_id

  #ingress_cidr_blocks      = ["10.10.0.0/16"]
  #ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_cidr_blocks = ["0.0.0.0/0"]
   egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = -1
      description = "egress"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}