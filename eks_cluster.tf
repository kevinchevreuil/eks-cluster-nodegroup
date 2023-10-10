resource "aws_eks_cluster" "kaisen-eks" {
  name                      = "Kaisen-EKS"
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  role_arn                  = module.eks_iam_role.iam-role
  version                   = var.k8s_version

  vpc_config {
    subnet_ids              = [module.aws_compute_base.subnet-a, module.aws_compute_base.subnet-b, module.aws_compute_base.subnet-c]
    security_group_ids      = [module.aws_compute_base.sg]
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  depends_on = [
    module.eks_iam_role.policy-attachment
  ]
}
