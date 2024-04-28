resource "aws_eks_node_group" "kaisen-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.kaisen-eks.name
  node_group_name = "Kaisen-EKS-NodeGroup"
  node_role_arn   = aws_iam_role.kaisen-eks-role.arn
  subnet_ids      = [module.aws_compute_base.public-subnet-a, module.aws_compute_base.public-subnet-b, module.aws_compute_base.public-subnet-c]
  disk_size       = "20"
  ami_type        = "AL2_x86_64"
  instance_types  = ["c5.2xlarge"]
  capacity_type   = "ON_DEMAND"

  scaling_config {
    desired_size = 3
    min_size     = 3
    max_size     = 450
  }
}
