data "aws_iam_role" "kaisen-eks" {
  name = var.eks_role
}

resource "aws_eks_cluster" "kaisen-eks" {
  name                      = "Kaisen-EKS"
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  role_arn                  = data.aws_iam_role.kaisen-eks.arn
  version                   = "1.27"

  vpc_config {
    subnet_ids              = [module.aws_compute_base.subnet-a, module.aws_compute_base.subnet-b, module.aws_compute_base.subnet-c]
    security_group_ids      = [module.aws_compute_base.sg]
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }
}
