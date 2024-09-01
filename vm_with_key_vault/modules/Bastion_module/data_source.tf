data "azurerm_subnet" "subnet" {
    name = "AzureBastionSubnet"
    resource_group_name = "queensland-dev"
    virtual_network_name = "dev-vnet89"
}

data "azurerm_public_ip" "pip" {
    name = "bas-pip"
    resource_group_name = "queensland-dev"
}