resource "aws_eks_cluster" "kdzdo-eks" {
  name                      = "Kdzdo-EKS"
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  role_arn                  = aws_iam_role.kdzdo-eks-role.arn
  version                   = var.k8s_version

  vpc_config {
    subnet_ids              = [module.aws_compute_base.public-subnet-a, module.aws_compute_base.public-subnet-b, module.aws_compute_base.public-subnet-c]
    security_group_ids      = [module.aws_compute_base.sg]
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  depends_on = [
    aws_iam_role_policy_attachment.kdzdo-eks-role-attachment
  ]
}
