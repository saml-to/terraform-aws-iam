output "provider_arn" {
  value = aws_iam_saml_provider.provider.arn
}

output "trust_policy" {
  value = data.aws_iam_policy_document.trust.json
}
