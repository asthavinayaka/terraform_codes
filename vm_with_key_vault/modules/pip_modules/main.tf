resource "azurerm_public_ip" "pip" {
    for_each = var.pip_details
    name = each.value.name
    resource_group_name = each.value.rg_name
    location = each.value.location
    allocation_method = "Static"
    sku = each.value.sku
}