data "tls_certificate" "kaisen-eks-oidc-tls-certificate" {
  url = aws_eks_cluster.kaisen-eks.identity[0].oidc[0].issuer
}

data "template_file" "kaisen-eks-iam-role-oidc" {
  template = file("eks_iam_role_oidc.json.tpl")

  vars = {
    oidc_arn = aws_iam_openid_connect_provider.kaisen-eks-oidc.arn
    oidc_url = aws_iam_openid_connect_provider.kaisen-eks-oidc.url
  }
}
