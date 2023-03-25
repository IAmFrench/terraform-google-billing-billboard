/* -------------------------------------------------------------------------- */
/*                       Google Cloud billing billboard                       */
/* -------------------------------------------------------------------------- */

resource "google_bigquery_dataset" "billboard" {
  project       = var.billboard_project_id
  dataset_id    = var.billboard_dataset_id
  friendly_name = "Billboard dataset."
  description   = "Billboard dataset."
  location      = var.billboard_dataset_location
}

data "http" "billing_standard_tables" {
  url = "https://bigquery.googleapis.com/bigquery/v2/projects/${var.billing_project_id}/datasets/${var.standard_billing_export_dataset_id}/tables"
  request_headers = {
    Authorization = "Bearer ${var.google_application_credentials}"
    Accept        = "application/json"
  }
}

data "http" "billing_detailed_tables" {
  url = "https://bigquery.googleapis.com/bigquery/v2/projects/${var.billing_project_id}/datasets/${var.detailed_billing_export_dataset_id}/tables"
  request_headers = {
    Authorization = "Bearer ${var.google_application_credentials}"
    Accept        = "application/json"
  }
}

locals {
  billing_standard_table_id = jsondecode(data.http.billing_standard_tables.response_body)["tables"][0]["tableReference"]["tableId"]
  billing_detailed_table_id = jsondecode(data.http.billing_detailed_tables.response_body)["tables"][0]["tableReference"]["tableId"]
}

resource "google_bigquery_table" "billboard_standard_table" {
  project    = var.billboard_project_id
  dataset_id = google_bigquery_dataset.billboard.dataset_id
  table_id   = var.billboard_standard_table_id
  view {
    query          = <<-EOT
    select *,
    COALESCE((SELECT SUM(x.amount)
    FROM UNNEST(s.credits) x),0) AS credits_sum_amount,
    COALESCE((SELECT SUM(x.amount)
    FROM UNNEST(s.credits) x),0) + cost as net_cost,
    PARSE_DATE("%Y%m", invoice.month) AS Invoice_Month,
    _PARTITIONDATE AS date
    from `${var.billing_project_id}.${var.standard_billing_export_dataset_id}.${local.billing_standard_table_id}` s
    WHERE _PARTITIONDATE > DATE_SUB(CURRENT_DATE(), INTERVAL 13 MONTH)
    EOT
    use_legacy_sql = false
  }
  deletion_protection = false
}

resource "google_bigquery_table" "billboard_detailed_table" {
  project    = var.billboard_project_id
  dataset_id = google_bigquery_dataset.billboard.dataset_id
  table_id   = var.billboard_detailed_table_id
  view {
    query          = <<-EOT
    select *,
    COALESCE((SELECT SUM(x.amount)
    FROM UNNEST(s.credits) x),0) AS credits_sum_amount,
    COALESCE((SELECT SUM(x.amount)
    FROM UNNEST(s.credits) x),0) + cost as net_cost,
    PARSE_DATE("%Y%m", invoice.month) AS Invoice_Month,
    _PARTITIONDATE AS date
    from `${var.billing_project_id}.${var.detailed_billing_export_dataset_id}.${local.billing_detailed_table_id}` s
    WHERE _PARTITIONDATE > DATE_SUB(CURRENT_DATE(), INTERVAL 13 MONTH)
    EOT
    use_legacy_sql = false
  }
  deletion_protection = false
}
