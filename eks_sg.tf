resource "aws_security_group" "kaisen-eks-sg" {
  name        = "kaisen-eks-sg"
  description = "Security group for EKS clusters"
  vpc_id      = module.aws_compute_base.vpc
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 30007
    to_port     = 30007
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
