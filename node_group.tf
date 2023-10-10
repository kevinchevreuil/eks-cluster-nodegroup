resource "aws_eks_node_group" "kaisen-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.kaisen-eks.name
  node_group_name = "Kaisen-EKS-NodeGroup"
  node_role_arn   = data.aws_iam_role.kaisen-eks.arn
  subnet_ids      = [module.aws_compute_base.subnet-a, module.aws_compute_base.subnet-b, module.aws_compute_base.subnet-c]
  disk_size       = "20"
  ami_type        = "AL2_x86_64"
  instance_types  = ["t2.micro"]
  capacity_type   = "ON_DEMAND"

  scaling_config {
    desired_size = 3
    min_size     = 3
    max_size     = 50
  }
}
