variable "location" {
    description = "Azure region for resource deployment"
    type        = string
    default     = "westeurope"
}

variable "environment" {
    description = "Deployment environment (e.g., dev, prod)"
    type        = string
    default     = "prod"
}

variable "organization_prefix" {
    description = "Prefix for resource naming"
    type        = string
    default     = "hdrei"
}

variable "resource_group_name" {
    description = "Name of the resource group"
    type        = string
    default     = "rg-hdrei-platform"
}
