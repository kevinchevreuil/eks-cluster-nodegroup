data "aws_iam_role" "kaisen-eks" {
  name = "${var.eks_role}"
}

resource "aws_eks_cluster" "kaisen-eks" {
  name = "Kaisen-EKS"
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  role_arn  = data.aws_iam_role.kaisen-eks.arn
  version = "1.27"

  vpc_config {
    subnet_ids              = [aws_subnet.kaisen-subnet-a.id, aws_subnet.kaisen-subnet-b.id, aws_subnet.kaisen-subnet-c.id]
    security_group_ids      = [aws_security_group.kaisen-default-sg.id]
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  #depends_on = [
    #aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
    #aws_cloudwatch_log_group.cluster
  #]
}
