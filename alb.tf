resource "aws_lb" "kaisen-eks-alb" {
  name                             = "Kaisen-EKS-ALB"
  internal                         = false
  load_balancer_type               = "application"
  security_groups                  = [module.aws_compute_base.sg]
  subnets                          = [module.aws_compute_base.public-subnet-a, module.aws_compute_base.public-subnet-b, module.aws_compute_base.public-subnet-c]
  enable_deletion_protection       = false
  enable_http2                     = true
  enable_cross_zone_load_balancing = true
  ip_address_type                  = "ipv4"
  preserve_host_header             = true

  depends_on = [
    aws_eks_node_group.kaisen-eks-nodegroup
  ]
}

resource "aws_lb_target_group" "kaisen-eks-alb-tg" {
  name                              = "Kaisen-EKS-ALB-TG"
  port                              = 30007
  protocol                          = "HTTP"
  vpc_id                            = module.aws_compute_base.vpc
  load_balancing_cross_zone_enabled = "use_load_balancer_configuration"
  target_type                       = "instance"
  ip_address_type                   = "ipv4"
  protocol_version                  = "HTTP1"
  load_balancing_algorithm_type     = "round_robin"

  health_check {
    enabled  = true
    path     = "/"
    protocol = "HTTP"
  }
  depends_on = [
    aws_eks_node_group.kaisen-eks-nodegroup
  ]
}

resource "aws_lb_listener" "kaisen-eks-alb-listener" {
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kaisen-eks-alb-tg.arn
  }
  load_balancer_arn = aws_lb.kaisen-eks-alb.arn
  port              = "80"
  protocol          = "HTTP"

  depends_on = [
    aws_eks_node_group.kaisen-eks-nodegroup
  ]
}

resource "aws_autoscaling_attachment" "kaisen-eks-alb-attachment" {
  autoscaling_group_name = aws_eks_node_group.kaisen-eks-nodegroup.resources.0.autoscaling_groups.0.name
  lb_target_group_arn    = aws_lb_target_group.kaisen-eks-alb-tg.arn

  depends_on = [
    aws_eks_node_group.kaisen-eks-nodegroup
  ]
}
