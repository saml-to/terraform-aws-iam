locals {
  provider_name                 = "${var.provider_name_prefix}-${var.owner}"
  trust_actions                 = ["sts:AssumeRoleWithSAML"]
  trust_principal_type          = "Federated"
  trust_condition_saml_test     = "StringEquals"
  trust_condition_saml_variable = "SAML:aud"
  trust_condition_saml_values   = ["https://signin.aws.amazon.com/saml"]
}

data "http" "metadata" {
  url = "https://sso.saml.to/github/saml2/${var.owner}"

  request_headers = {
    "User-Agent" = "terraform-aws-saml-to"
  }
}

resource "aws_iam_saml_provider" "provider" {
  name                   = local.provider_name
  saml_metadata_document = data.http.metadata.response_body
}

data "aws_iam_policy_document" "trust" {
  statement {
    actions = local.trust_actions
    effect  = "Allow"

    principals {
      identifiers = [aws_iam_saml_provider.provider.arn]
      type        = local.trust_principal_type
    }

    condition {
      test     = local.trust_condition_saml_test
      variable = local.trust_condition_saml_variable
      values   = local.trust_condition_saml_values
    }
  }
}