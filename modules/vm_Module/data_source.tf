data "azurerm_subnet" "subnets" {
    for_each = var.vms_details
    name = each.value.subnet_name
    virtual_network_name = each.value.vnet_name
    resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "kvs1" {
    name = "queensland-dev-kv"
    resource_group_name = "queensland-dev"
}

data "azurerm_key_vault_secret" "username" {
    name = "username"
    key_vault_id = data.azurerm_key_vault.kvs1.id
}

data "azurerm_key_vault_secret" "password" {
    name = "password"
    key_vault_id = data.azurerm_key_vault.kvs1.id
}