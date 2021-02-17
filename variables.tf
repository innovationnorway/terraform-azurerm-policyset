# variable "name_prefix" {
#   type        = string
#   description = "Creates a unique name beginning with the specified prefix."

#   validation {
#     condition     = can(regex("^[a-z0-9-]{3,24}$", var.name_prefix))
#     error_message = "The name_prefix value must be between 3 and 24 characters in length and use numbers, hyphen and lower-case letters only."
#   }
# }

locals {
  policy_files = fileset(var.policy_folder, "*.json")

  policy_files_without_extension = [for p in local.policy_files : split(".", p)[0]]

  policy_json = {
    for policy in local.policy_files_without_extension :
    policy => jsondecode(file(join("", [var.policy_folder, policy, ".json"])))
  }
}

variable "policy_folder" {
  type        = string
  description = "Folder where policy files reside"
  default     = "policies/"
}

variable "name_space" {
  type        = string
  description = "Naming of json files"
  default     = "Deploy-Prod"
}
