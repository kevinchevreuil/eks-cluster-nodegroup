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

resource "aws_eks_addon" "kaisen-eks-addon-ebs-csi-driver" {
  cluster_name                = aws_eks_cluster.kaisen-eks.name
  addon_name                  = "aws-ebs-csi-driver"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  service_account_role_arn    = aws_iam_role.kaisen-eks-iam-role-oidc.arn
  depends_on = [
    aws_eks_node_group.kaisen-eks-nodegroup,
    aws_iam_role.kaisen-eks-iam-role-oidc
  ]
}

resource "aws_eks_addon" "kaisen-eks-addon-csi-snapshot" {
  cluster_name                = aws_eks_cluster.kaisen-eks.name
  addon_name                  = "snapshot-controller"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_node_group.kaisen-eks-nodegroup
  ]
}

resource "aws_eks_addon" "kaisen-eks-addon-csi-s3" {
  cluster_name                = aws_eks_cluster.kaisen-eks.name
  addon_name                  = "aws-mountpoint-s3-csi-driver"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [
    aws_eks_node_group.kaisen-eks-nodegroup
  ]
}
