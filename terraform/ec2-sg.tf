module "ec2_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "assignment-ec2-sg"#var.ec2_sg_name
  description = "Security group for ec2 instance open to only load balancer and ssh"
  vpc_id      = "vpc-20685748"#var.vpc_id

 ingress_cidr_blocks      = ["180.94.33.120/32"]
 # ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "180.94.33.120/32"
    }
  ]
    ingress_with_source_security_group_id = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "http"
      source_security_group_id = module.alb_sg.security_group_id
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