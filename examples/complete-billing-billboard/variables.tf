variable "google_application_credentials" {
  type        = string
  description = "Google application crendentials used to fetch BigQuery tables REST API. use the folowing command: gcloud auth application-default print-access-token."
  nullable    = false
  sensitive   = true
}
