
resource "azurerm_key_vault_secret" "secrets" {
    for_each = var.secret_details
    name = each.value.name
    value = each.value.value
    key_vault_id = data.azurerm_key_vault.kvs.id
}