resource "azurerm_virtual_network" "hub" {
    name                = "${var.organization_prefix}-hub-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "firewall" {
    name                 = "AzureFirewallSubnet"
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.hub.name
    address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_firewall" "main" {
    name                = "${var.organization_prefix}-firewall"
    location            = var.location
    resource_group_name = var.resource_group_name
    sku_name            = "AZFW_VNet"
    sku_tier            = "Standard"
    ip_configuration {
        name                 = "configuration"
        subnet_id            = azurerm_subnet.firewall.id
        public_ip_address_id = azurerm_public_ip.firewall.id
    }
}

resource "azurerm_public_ip" "firewall" {
    name                = "${var.organization_prefix}-firewall-pip"
    location            = var.location
    resource_group_name = var.resource_group_name
    allocation_method   = "Static"
    sku                 = "Standard"
}
