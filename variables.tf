# variable "root_policy_folder" {
#   type        = string
#   description = "Folder where policy files reside"
#   default     = "policies"
# }

variable "policy_type" {
  type        = string
  description = "Type of policies to set"
  default     = "diagnostic"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for naming of policies in TF and Azure Portal"
  default     = "Deploy-Prod"
}

variable "policy_set_category" {
  type        = string
  description = "Defines which category the policy set should be in"
  default     = "Monitoring"
}

variable "policy_set_assignement_scope" {
  type        = string
  description = "Set the scope to where the policy set should be assigned. Can be Management Group, Subscription or Resource Group."
  default     = "/providers/Microsoft.Management/managementGroups/innovationnorway"
}

variable "policy_assignment_location" {
  type        = string
  description = "Location of Policy Assignment"
  default     = "westeurope"
}

variable "enforcement_mode" {
  type        = bool
  description = "Should policy be enforced: true/false"
  default     = "false"
}
