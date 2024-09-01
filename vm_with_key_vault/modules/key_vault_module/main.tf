resource "azurerm_key_vault" "kvs" {
    for_each = var.key_details
    name = each.value.name
    resource_group_name = each.value.rg_name
    location = each.value.location
    tenant_id = data.azurerm_client_config.client_config.tenant_id
    sku_name = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled = false

    access_policy {
        tenant_id = data.azurerm_client_config.client_config.tenant_id
        object_id = data.azurerm_client_config.client_config.object_id

        key_permissions = ["List", "Get", "Create"]
        secret_permissions = ["List", "Get","Set", "Delete", "Purge", "Recover"]
        storage_permissions = ["List", "Get"]
    }
}

