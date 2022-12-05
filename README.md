[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-saml-to-blueviolet)](https://github.com/saml-to)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/saml-to/terraform-aws-iam)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.0.0-blue.svg)

## Description

Install SAML.to as an IAM Provider to an AWS Account.

## Usage

```hcl
module "saml_to" {
  source  = "saml-to/iam/aws"
  
  organization = "your_github_user_or_organization"
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
| <a name="input_organization"></a> [organization](#input\_organization) | The GitHub Orgranization | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_provider_arn"></a> [provider\_arn](#output\_provider\_arn) | n/a |
| <a name="output_trust_policy"></a> [trust\_policy](#output\_trust\_policy) | n/a |
<!-- END_TF_DOCS -->
