resource "azurerm_log_analytics_workspace" "example" {
    name                = "${var.organization_prefix}-law"
    location            = var.location
    resource_group_name = var.resource_group_name
    sku                 = "PerGB2018"
    retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "example" {
    name               = "${var.organization_prefix}-diag"
    target_resource_id = var.target_resource_id
    log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

    log {
        category = "Administrative"
        enabled  = true
        retention_policy {
            enabled = true
            days    = 30
        }
    }

    metric {
        category = "AllMetrics"
        enabled  = true

        retention_policy {
        enabled = true
        days    = 30
        }
    }
}
