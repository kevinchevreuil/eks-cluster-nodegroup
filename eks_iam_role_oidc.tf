resource "aws_iam_openid_connect_provider" "kaisen-eks-oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.kaisen-eks-oidc-tls-certificate.certificates.0.sha1_fingerprint]
  url             = aws_eks_cluster.kaisen-eks.identity[0].oidc[0].issuer
}

resource "aws_iam_role" "kaisen-eks-iam-role-oidc" {
  name = "Kaisen-EKS-OIDC"
  assume_role_policy = data.template_file.kaisen-eks-iam-role-oidc.rendered
}

resource "aws_iam_role_policy_attachment" "kaisen-eks-iam-oidc-attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy",
  ])

  role = aws_iam_role.kaisen-eks-iam-role-oidc.name
  policy_arn = each.value
}
