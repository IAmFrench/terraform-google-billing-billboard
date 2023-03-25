output "billboard_dataset_id" {
  description = "BigQuery billboard dataset id."
  value       = google_bigquery_dataset.billboard.dataset_id
}

output "billboard_standard_template_link" {
  description = "Pre-configured template link to deploy the Looker Studio billboard v3.0 dashboard."
  value = join("", [
    "https://lookerstudio.google.com/reporting/create?c.reportId=64387229-05e0-4951-aa3f-e7349bbafc07&ds.ds8.refreshFields=false&ds.ds8.connector=bigQuery&ds.ds8.type=TABLE",
    "&ds.ds8.tableId=${var.billboard_standard_table_id}",
    "&r.reportName=${replace(var.looker_studio_billboard_name, " ", "_")}",
    "&ds.ds8.projectId=${var.billboard_project_id}",
    "&ds.ds8.datasetId=${var.billboard_dataset_id}",
  ])
}
