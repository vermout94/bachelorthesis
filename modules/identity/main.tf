resource "azuread_group" "department_groups" {
  for_each         = toset(["it", "hr", "finance", "marketing", "engineering"])
  display_name     = "grp-${each.key}-users"
  security_enabled = true
}

data "azuread_directory_role" "global_administrator" {
  display_name = "Global Administrator"
}

resource "azuread_directory_role_assignment" "it_admin_role" {
  role_id             = data.azuread_directory_role.global_administrator.id
  principal_object_id = azuread_group.department_groups["it"].object_id
}
