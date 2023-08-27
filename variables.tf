variable "private_key_path" {
  type    = string
  default = "./linux-key-pair.pem"
}

variable "aws_region" {
  type    = string
}

variable "eks_role" {
  type    = string
}
