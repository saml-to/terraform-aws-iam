![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/saml-to/terraform-aws-iam)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.0-blue.svg)

## Description

Install SAML.to as an IAM Provider to an AWS Account.

## Usage

### Option 1: Use the Generated Trust Policy

```hcl
# Creates a SAML Provider in AWS for SAML.to
module "saml_to_iam" {
  source  = "saml-to/iam/aws"

  owner = "a_github_user_or_organization"
}

# Create a role which trusts SAML.to
resource "aws_iam_role" "my_role" {
  name               = "my_role"
  assume_role_policy = module.saml_to_iam.trust_policy
}
```

### Option 2: Generate a Custom Trust Policy

```hcl
# Creates a SAML Provider in AWS for SAML.to
module "saml_to_iam" {
  source  = "saml-to/iam/aws"

  owner = "a_github_user_or_organization"
}

# Create a Trust Policy
data "aws_iam_policy_document" "saml_to_trust" {
  statement {
    actions = module.saml_to_iam.trust_actions
    effect  = "Allow"

    principals {
      identifiers = module.saml_to_iam.trust_principal_identifiers
      type        = module.saml_to_iam.trust_principal_type
    }

    condition {
      test     = module.saml_to_iam.trust_condition_saml_test
      variable = module.saml_to_iam.trust_condition_saml_variable
      values   = module.saml_to_iam.trust_condition_saml_values
    }
  }
}

# Create a role which trusts SAML.to
resource "aws_iam_role" "my_role" {
  name               = "my_role"
  assume_role_policy = data.aws_iam_policy_document.saml_to_trust.json
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.45.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_saml_provider.provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_saml_provider) | resource |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [http_http.metadata](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_owner"></a> [owner](#input\_owner) | A GitHub User or Orgranization | `string` | n/a | yes |
| <a name="input_provider_name_prefix"></a> [provider\_name\_prefix](#input\_provider\_name\_prefix) | Prefix for the name of the AWS IAM SAML Provider | `string` | `"saml.to"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_owner"></a> [owner](#output\_owner) | Re-output of `var.owner` |
| <a name="output_provider_arn"></a> [provider\_arn](#output\_provider\_arn) | The ARN of the AWS IAM SAML Provider |
| <a name="output_provider_name"></a> [provider\_name](#output\_provider\_name) | The name of the AWS IAM SAML Provider (default: `{var.provider_name_prefix}-{var.owner}`) |
| <a name="output_trust_actions"></a> [trust\_actions](#output\_trust\_actions) | The IAM Trust Relationship Actions (`["sts:AssumeRoleWithSAML"]`) |
| <a name="output_trust_condition_saml_test"></a> [trust\_condition\_saml\_test](#output\_trust\_condition\_saml\_test) | The IAM Trust Relationship Condition Test for SAML (`StringEquals`) |
| <a name="output_trust_condition_saml_values"></a> [trust\_condition\_saml\_values](#output\_trust\_condition\_saml\_values) | The IAM Trust Relationship Condition Values for SAML (`["https://signin.aws.amazon.com/saml"]`) |
| <a name="output_trust_condition_saml_variable"></a> [trust\_condition\_saml\_variable](#output\_trust\_condition\_saml\_variable) | The IAM Trust Relationship Condition Variable for SAML (`SAML:aud`) |
| <a name="output_trust_policy"></a> [trust\_policy](#output\_trust\_policy) | A policy, in JSON format, that can be added to Role Trust Relationships |
| <a name="output_trust_principal_identifiers"></a> [trust\_principal\_identifiers](#output\_trust\_principal\_identifiers) | The IAM Trust Relationship Principal Identifiers (a single-item list containing the Provider ARN) |
| <a name="output_trust_principal_type"></a> [trust\_principal\_type](#output\_trust\_principal\_type) | The IAM Trust Relationship Principal Type (`Federated`) |
<!-- END_TF_DOCS -->
