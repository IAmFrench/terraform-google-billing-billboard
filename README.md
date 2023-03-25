# Google Cloud billing billboard Terraform Module

This module for GCP will create dataset used by the Google billboard and provide link to create the associated Looker Studio dashboard.

![GCP Billboard v3.0](https://cloud.google.com/static/billing/docs/images/visualize-tutorial-dashboard.png)

> source: https://cloud.google.com/billing/docs/how-to/visualize-data

This work is based on [GoogleCloudPlatform/professional-services/examples/billboard](https://github.com/GoogleCloudPlatform/professional-services/tree/main/examples/billboard).

For a guided deployment using Cloud Shell (not Terraform), you can use the walkthrough tutorial available in the previous link.

This Terraform module use the `http` Terraform provider to retrieve BigQuery billing table. You will need to provide an application token to authenticate to Google Cloud REST API. You can acheve this using the following command: `gcloud auth application-default print-access-token`.

This Terraform Module will produce a Looker Studio Link, you will need to open it and click on the "Edit and Share" top right button to save this dashboard.

## Sources

- [Visualize your costs with Looker Studio](https://cloud.google.com/billing/docs/how-to/visualize-data)
- [DEMO - Billing usage and cost insights dashboard](https://lookerstudio.google.com/c/reporting/64387229-05e0-4951-aa3f-e7349bbafc07/page/p_l3qef1s8rc)
- [GoogleCloudPlatform/professional-services/examples/billboard](https://github.com/GoogleCloudPlatform/professional-services/blob/main/examples/billboard/billboard.py)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.58.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 3.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.58.0 |
| <a name="provider_http"></a> [http](#provider\_http) | >= 3.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_bigquery_dataset.billboard](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset) | resource |
| [google_bigquery_table.billboard_detailed_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table) | resource |
| [google_bigquery_table.billboard_standard_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table) | resource |
| [http_http.billing_detailed_tables](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.billing_standard_tables](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billboard_dataset_id"></a> [billboard\_dataset\_id](#input\_billboard\_dataset\_id) | Dataset ID used for the Looker Studio billboard v3.0. | `string` | `"billboard"` | no |
| <a name="input_billboard_dataset_location"></a> [billboard\_dataset\_location](#input\_billboard\_dataset\_location) | Location used for BigQuery billboard datasets. | `string` | n/a | yes |
| <a name="input_billboard_detailed_table_id"></a> [billboard\_detailed\_table\_id](#input\_billboard\_detailed\_table\_id) | Table ID used for the Looker Studio billboard v3.0 with detailed billing data. | `string` | `"detailed_billboard"` | no |
| <a name="input_billboard_project_id"></a> [billboard\_project\_id](#input\_billboard\_project\_id) | Project ID used for hosting BigQuery billing datasets. | `string` | n/a | yes |
| <a name="input_billboard_standard_table_id"></a> [billboard\_standard\_table\_id](#input\_billboard\_standard\_table\_id) | Table ID used for the Looker Studio billboard v3.0 with standard billing data. | `string` | `"standard_billboard"` | no |
| <a name="input_billing_project_id"></a> [billing\_project\_id](#input\_billing\_project\_id) | Project ID used for hosting BigQuery billing datasets. | `string` | n/a | yes |
| <a name="input_detailed_billing_export_dataset_id"></a> [detailed\_billing\_export\_dataset\_id](#input\_detailed\_billing\_export\_dataset\_id) | Dataset ID used for the detailed billing export. | `string` | `"detailed_billing_export"` | no |
| <a name="input_google_application_credentials"></a> [google\_application\_credentials](#input\_google\_application\_credentials) | Google application crendentials used to fetch BigQuery tables REST API. use the folowing command: gcloud auth application-default print-access-token. | `string` | n/a | yes |
| <a name="input_looker_studio_billboard_name"></a> [looker\_studio\_billboard\_name](#input\_looker\_studio\_billboard\_name) | Name of the Looker Studio billboard dashboard. | `string` | `"Google Cloud Billboard v3.0"` | no |
| <a name="input_standard_billing_export_dataset_id"></a> [standard\_billing\_export\_dataset\_id](#input\_standard\_billing\_export\_dataset\_id) | Dataset ID used for the standard billing export. | `string` | `"standard_billing_export"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_billboard_dataset_id"></a> [billboard\_dataset\_id](#output\_billboard\_dataset\_id) | BigQuery billboard dataset id. |
| <a name="output_billboard_standard_template_link"></a> [billboard\_standard\_template\_link](#output\_billboard\_standard\_template\_link) | Pre-configured template link to deploy the Looker Studio billboard v3.0 dashboard. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
