resource "azurerm_management_group" "root" {
    display_name = "${var.organization_prefix}-root"
    name         = "${var.organization_prefix}-root"
}

resource "azurerm_management_group" "platform" {
    display_name = "${var.organization_prefix}-platform"
    name         = "${var.organization_prefix}-platform"
    parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_management_group" "landing_zones" {
    display_name = "${var.organization_prefix}-landing-zones"
    name         = "${var.organization_prefix}-landing-zones"
    parent_management_group_id = azurerm_management_group.root.id
}
