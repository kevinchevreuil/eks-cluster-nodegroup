resource "aws_iam_openid_connect_provider" "kdzdo-eks-oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.kdzdo-eks-oidc-tls-certificate.certificates.0.sha1_fingerprint]
  url             = aws_eks_cluster.kdzdo-eks.identity[0].oidc[0].issuer
}

resource "aws_iam_role" "kdzdo-eks-iam-role-oidc" {
  name = "Kdzdo-EKS-OIDC"
  assume_role_policy = data.template_file.kdzdo-eks-iam-role-oidc.rendered
}

resource "aws_iam_role_policy_attachment" "kdzdo-eks-iam-oidc-attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy",
  ])

  role = aws_iam_role.kdzdo-eks-iam-role-oidc.name
  policy_arn = each.value
}
