

output "billboard_standard_template_link" {
  description = "Pre-configured template link to deploy the Looker Studio billboard v3.0 dashboard."
  value       = module.google_billing_billboard.billboard_standard_template_link
}
