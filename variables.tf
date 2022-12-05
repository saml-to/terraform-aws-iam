variable "organization" {
  type        = string
  description = "The GitHub Orgranization"
}

variable "provider_name" {
  type        = string
  description = "The desired name of the AWS IAM SAML Provider"
  default     = "saml.to"
}