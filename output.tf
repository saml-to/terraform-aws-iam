output "owner" {
  value       = var.owner
  description = "Re-output of `var.owner`"
}

output "provider_arn" {
  value       = aws_iam_saml_provider.provider.arn
  description = "The ARN of the AWS IAM SAML Provider"
}

output "provider_name" {
  value       = local.provider_name
  description = "The name of the AWS IAM SAML Provider (`{var.provider_name_prefix}-{var.owner}`)"
}

output "trust_policy" {
  value       = data.aws_iam_policy_document.trust.json
  description = "A policy, in JSON format, that can be added to Role Trust Relationships"
}

output "trust_actions" {
  value       = local.trust_actions
  description = "The IAM Trust Relationship Actions (`[\"sts:AssumeRoleWithSAML\"]`)"
}

output "trust_principal_identifiers" {
  value       = [aws_iam_saml_provider.provider.arn]
  description = "The IAM Trust Relationship Principal Identifiers (a single-item list containing the Provider ARN)"
}

output "trust_principal_type" {
  value       = local.trust_principal_type
  description = "The IAM Trust Relationship Principal Type (`Federated`)"
}

output "trust_condition_saml_test" {
  value       = local.trust_condition_saml_test
  description = "The IAM Trust Relationship Condition Test for SAML (`StringEquals`)"
}

output "trust_condition_saml_variable" {
  value       = local.trust_condition_saml_variable
  description = "The IAM Trust Relationship Condition Variable for SAML (`SAML:aud`)"
}

output "trust_condition_saml_values" {
  value       = local.trust_condition_saml_values
  description = "The IAM Trust Relationship Condition Values for SAML (`[\"https://signin.aws.amazon.com/saml\"]`)"
}