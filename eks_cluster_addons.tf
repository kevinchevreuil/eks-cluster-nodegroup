resource "aws_eks_addon" "kaisen-eks-addon-vpc-cni" {
  cluster_name                = aws_eks_cluster.kaisen-eks.name
  addon_name                  = "vpc-cni"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_node_group.kaisen-eks-nodegroup
  ]
}

resource "aws_eks_addon" "kaisen-eks-addon-coredns" {
  cluster_name                = aws_eks_cluster.kaisen-eks.name
  addon_name                  = "coredns"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_node_group.kaisen-eks-nodegroup
  ]
}

resource "aws_eks_addon" "kaisen-eks-addon-kube-proxy" {
  cluster_name                = aws_eks_cluster.kaisen-eks.name
  addon_name                  = "kube-proxy"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_node_group.kaisen-eks-nodegroup
  ]
}
