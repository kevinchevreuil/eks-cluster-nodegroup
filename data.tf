data "tls_certificate" "kdzdo-eks-oidc-tls-certificate" {
  url = aws_eks_cluster.kdzdo-eks.identity[0].oidc[0].issuer
}

data "template_file" "kdzdo-eks-iam-role-oidc" {
  template = file("eks_iam_role_oidc.json.tpl")

  vars = {
    oidc_arn = aws_iam_openid_connect_provider.kdzdo-eks-oidc.arn
    oidc_url = aws_iam_openid_connect_provider.kdzdo-eks-oidc.url
  }
}
