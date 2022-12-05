data "http" "metadata" {
  url = "https://sso.saml.to/github/saml2/${var.organization}"

  request_headers = {
    "User-Agent" = "terraform-aws-saml-to"
  }
}

resource "aws_iam_saml_provider" "provider" {
  name                   = "saml.to"
  saml_metadata_document = data.http.metadata.response_body
}

data "aws_iam_policy_document" "trust" {
  statement {
    actions = ["sts:AssumeRoleWithSAML"]
    effect  = "Allow"

    principals {
      identifiers = [aws_iam_saml_provider.provider.arn]
      type        = "Federated"
    }

    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }
  }
}