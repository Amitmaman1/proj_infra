data "aws_eks_cluster" "this" {
  name = "${var.env}-${var.eks_name}"
}

resource "aws_iam_openid_connect_provider" "this" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
  client_id_list   = ["sts.amazonaws.com"]
  thumbprint_list  = ["9e99a48a9960b14926bb7f3b02e22da0afd10df6"]
}

data "aws_iam_policy_document" "eso_read" {
  statement {
    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecrets",
      "ssm:GetParameter",
      "ssm:GetParameters",
      "ssm:GetParametersByPath",
      "ssm:DescribeParameters"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "eso_read" {
  name   = "${var.env}-${var.eks_name}-external-secrets-read"
  policy = data.aws_iam_policy_document.eso_read.json
}


data "aws_iam_policy_document" "eso_trust" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.this.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.this.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:external-secrets:external-secrets"]
    }
  }
}

resource "aws_iam_role" "external_secrets" {
  name               = "${var.env}-${var.eks_name}-external-secrets"
  assume_role_policy = data.aws_iam_policy_document.eso_trust.json
}

resource "aws_iam_role_policy_attachment" "eso_attach" {
  role       = aws_iam_role.external_secrets.name
  policy_arn = aws_iam_policy.eso_read.arn
}
