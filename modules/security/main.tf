resource "azurerm_network_security_group" "department_nsg" {
  for_each            = var.subnet_ids
  name                = "nsg-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "Deny-All-Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
  for_each                  = var.subnet_ids
  subnet_id                 = each.value
  network_security_group_id = azurerm_network_security_group.department_nsg[each.key].id
}
