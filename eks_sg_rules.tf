resource "aws_security_group_rule" "kdzdo-eks-sg-ingress80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "EKS cluster 80 HTTP allow"
  security_group_id = aws_eks_cluster.kdzdo-eks.vpc_config[0].cluster_security_group_id

  depends_on = [
    aws_eks_node_group.kdzdo-eks-nodegroup
  ]
}

resource "aws_security_group_rule" "kdzdo-eks-sg-ingress443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "EKS cluster 443 HTTP allow"
  security_group_id = aws_eks_cluster.kdzdo-eks.vpc_config[0].cluster_security_group_id

  depends_on = [
    aws_eks_node_group.kdzdo-eks-nodegroup
  ]
}

resource "aws_security_group_rule" "kdzdo-eks-sg-nodeport" {
  type              = "ingress"
  from_port         = 30007
  to_port           = 30007
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "EKS cluster 30007 (NodePort K8s SVC) allow"
  security_group_id = aws_eks_cluster.kdzdo-eks.vpc_config[0].cluster_security_group_id

  depends_on = [
    aws_eks_node_group.kdzdo-eks-nodegroup
  ]
}
