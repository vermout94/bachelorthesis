terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

module "management" {
  source = "./modules/management"
  organization_prefix = var.organization_prefix
}

module "connectivity" {
  source = "./modules/connectivity"
  organization_prefix = var.organization_prefix
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "identity" {
  source = "./modules/identity"
  organization_prefix = var.organization_prefix
}

module "security" {
  source = "./modules/security"
  organization_prefix = var.organization_prefix
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "monitoring" {
  source = "./modules/monitoring"
  organization_prefix = var.organization_prefix
  location            = var.location
  resource_group_name = var.resource_group_name
}
