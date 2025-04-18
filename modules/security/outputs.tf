output "nsg_ids" {
    description = "IDs of the created Network Security Groups"
    value = {
        for key, nsg in azurerm_network_security_group.department_nsg :
        key => nsg.id
    }
}
