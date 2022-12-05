variable "owner" {
  type        = string
  description = "A GitHub User or Orgranization"
}

variable "provider_name_prefix" {
  type        = string
  description = "Prefix for the name of the AWS IAM SAML Provider"
  default     = "saml.to"
}