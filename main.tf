module "diagnostic_policy" {
  source = "git::https://github.com/innovationnorway/platform-policies.git?ref=ts/diagnostic"
  # source = "C:/TF/Terraform Policies/platform-policies"

  root_policy_folder           = "policies"
  policy_type                  = "diagnostic"
  name_prefix                  = "Deploy-Prod"
  policy_set_category          = "Monitoring"
  policy_set_assignement_scope = "/providers/Microsoft.Management/managementGroups/innovationnorway"
  policy_assignment_location   = "westeurope"
  enforcement_mode             = false
}
