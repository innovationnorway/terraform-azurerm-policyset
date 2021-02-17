# resource "random_id" "main" {
#   keepers = {
#     # Generate a new id each time we change the name prefix
#     name_prefix = var.name_prefix
#   }

#   byte_length = 4
# }

resource "azurerm_policy_definition" "policy" {
  for_each = local.policy_json

  name         = join("", [var.name_space, " - ", each.value.name])
  display_name = join("", [var.name_space, " - ", each.value.properties.displayName])
  policy_type  = each.value.properties.policyType
  mode         = each.value.properties.mode
  metadata     = jsonencode(each.value.properties.metadata)
  policy_rule  = jsonencode(each.value.properties.policyRule)
  parameters   = jsonencode(each.value.properties.parameters)

  lifecycle {
    ignore_changes = [
      metadata
    ]
  }
}
