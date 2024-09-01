resource "azurerm_bastion_host" "bhs" {
    for_each = var.bastion_details
    name = each.value.name
    resource_group_name = each.value.rg_name
    location = each.value.location
    ip_configuration {
      name = "basip"
      subnet_id = data.azurerm_subnet.subnet.id
      public_ip_address_id = data.azurerm_public_ip.pip.id
    }
}