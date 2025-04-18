terraform {
    backend "azurerm" {
        resource_group_name  = "hdrei-terraform-state"
        storage_account_name = "hdreiterraform"
        container_name       = "tfstate"
        key                  = "prod.terraform.tfstate"
    }
}
