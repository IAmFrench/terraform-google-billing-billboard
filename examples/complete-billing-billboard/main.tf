provider "google" {
  project = local.billboard_project_id
  region  = local.region
  zone    = local.zone
}

locals {
  region                             = "europe-west3"
  zone                               = "europe-west3-a"
  billboard_dataset_location         = "eu"
  billboard_project_id               = "billing-prd"
  billing_project_id                 = "billing-prd"
  standard_billing_export_dataset_id = "billing_export"
  detailed_billing_export_dataset_id = "detailed_billing_export"
  billboard_dataset_id               = "billboard"
  billboard_standard_table_id        = "standard_billboard"
  billboard_detailed_table_id        = "detailed_billboard"
  looker_studio_billboard_name       = "Google Cloud Billboard v3.0"
}

/* -------------------------------------------------------------------------- */
/*                       Google Cloud billing billboard                       */
/* -------------------------------------------------------------------------- */

module "google_billing_billboard" {
  source                             = "../../"
  billboard_dataset_location         = local.billboard_dataset_location
  billboard_project_id               = local.billboard_project_id
  billing_project_id                 = local.billing_project_id
  google_application_credentials     = var.google_application_credentials
  standard_billing_export_dataset_id = local.standard_billing_export_dataset_id
  detailed_billing_export_dataset_id = local.detailed_billing_export_dataset_id
  billboard_dataset_id               = local.billboard_dataset_id
  billboard_standard_table_id        = local.billboard_standard_table_id
  billboard_detailed_table_id        = local.billboard_detailed_table_id
  looker_studio_billboard_name       = local.looker_studio_billboard_name
}
