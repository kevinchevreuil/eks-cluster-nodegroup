provider "aws" {
  region = var.aws_region
}

module "aws_compute_base" {
  source     = "./modules/aws-compute-base"
  aws_region = var.aws_region
}

module "eks_iam_role" {
  source = "./modules/eks-iam-role"
}
