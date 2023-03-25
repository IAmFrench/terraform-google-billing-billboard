variable "billboard_dataset_location" {
  type        = string
  description = "Location used for BigQuery billboard datasets."
  nullable    = false
}

variable "billboard_project_id" {
  type        = string
  description = "Project ID used for hosting BigQuery billing datasets."
  nullable    = false
}

variable "billing_project_id" {
  type        = string
  description = "Project ID used for hosting BigQuery billing datasets."
  nullable    = false
}

variable "google_application_credentials" {
  type        = string
  description = "Google application crendentials used to fetch BigQuery tables REST API. use the folowing command: gcloud auth application-default print-access-token."
  nullable    = false
  sensitive   = true
}

/* -------------------------------- Optionals ------------------------------- */


variable "standard_billing_export_dataset_id" {
  type        = string
  default     = "standard_billing_export"
  description = "Dataset ID used for the standard billing export."
  nullable    = false
}

variable "detailed_billing_export_dataset_id" {
  type        = string
  default     = "detailed_billing_export"
  description = "Dataset ID used for the detailed billing export."
  nullable    = false
}

variable "billboard_dataset_id" {
  type        = string
  default     = "billboard"
  description = "Dataset ID used for the Looker Studio billboard v3.0."
  nullable    = false
}

variable "billboard_standard_table_id" {
  type        = string
  default     = "standard_billboard"
  description = "Table ID used for the Looker Studio billboard v3.0 with standard billing data."
  nullable    = false
}

variable "billboard_detailed_table_id" {
  type        = string
  default     = "detailed_billboard"
  description = "Table ID used for the Looker Studio billboard v3.0 with detailed billing data."
  nullable    = false
}

variable "looker_studio_billboard_name" {
  type        = string
  default     = "Google Cloud Billboard v3.0"
  description = "Name of the Looker Studio billboard dashboard."
  nullable    = false
}
