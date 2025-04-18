variable "organization_prefix" {
    description = "Prefix for resource naming"
    type        = string
}

variable "location" {
    description = "Azure region for resource deployment"
    type        = string
}

variable "resource_group_name" {
    description = "Name of the resource group"
    type        = string
}
