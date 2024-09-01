resource "azurerm_network_interface" "nics" {
    for_each = var.vms_details
    name = each.value.nic_name
    resource_group_name = each.value.rg_name
    location = each.value.location
    ip_configuration {
      name = "nic-conf"
      private_ip_address_allocation = "Dynamic"
      subnet_id = data.azurerm_subnet.subnets[each.key].id
    }
  
}

resource "azurerm_linux_virtual_machine" "lvms" {
    for_each = var.vms_details
    name = each.value.vm_name
    resource_group_name = each.value.rg_name
    location = each.value.location
    size = each.value.size
    admin_username = data.azurerm_key_vault_secret.username.value
    admin_password = data.azurerm_key_vault_secret.password.value
    disable_password_authentication = false
    network_interface_ids = [ azurerm_network_interface.nics[each.key].id ]

    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }
}