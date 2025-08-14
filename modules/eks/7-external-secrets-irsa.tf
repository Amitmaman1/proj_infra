# Using existing aws_eks_cluster data source from 1-eks.tf
# Using existing aws_iam_openid_connect_provider from 4-irsa.tf

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
      identifiers = [aws_iam_openid_connect_provider.this[0].arn]
    }
    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.this[0].url, "https://", "")}:sub"
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
