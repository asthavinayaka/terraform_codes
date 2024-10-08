resource "azurerm_subnet" "subnets" {
    for_each = var.subnet_details
    name = each.value.name
    resource_group_name = each.value.rg_name
    virtual_network_name = each.value.vnet_name
    address_prefixes = each.value.prefixes
}