# Billing Billboard for Google Cloud

This example will create required BigQuery dataset and tables for the Looker Studio Billboard dashboard.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.58.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 3.2.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_google_billing_billboard"></a> [google\_billing\_billboard](#module\_google\_billing\_billboard) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_google_application_credentials"></a> [google\_application\_credentials](#input\_google\_application\_credentials) | Google application crendentials used to fetch BigQuery tables REST API. use the folowing command: gcloud auth application-default print-access-token. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_billboard_standard_template_link"></a> [billboard\_standard\_template\_link](#output\_billboard\_standard\_template\_link) | Pre-configured template link to deploy the Looker Studio billboard v3.0 dashboard. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
