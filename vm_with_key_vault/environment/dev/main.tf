module "resource_group" {
  source     = "../../modules/rg_module"
  rg_details = var.rg_map
}

module "virtual_network" {
  source       = "../../modules/vnet_module"
  vnet_details = var.vnet_map
  depends_on   = [module.resource_group]
}

module "subnet" {
  source         = "../../modules/subnet_module"
  subnet_details = var.subnet_map
  depends_on     = [module.virtual_network]
}

module "key_vault" {
  source      = "../../modules/key_vault_module"
  key_details = var.key_map
  depends_on  = [module.resource_group]
}

module "key_vault_secret" {
  source         = "../../modules/secret_module"
  secret_details = var.secret_map
  depends_on     = [module.key_vault]
}

module "virtual_machine" {
  source      = "../../modules/vm_Module"
  vms_details = var.vm_map
  depends_on  = [module.subnet, module.key_vault_secret]
}

module "public_ip" {
  source      = "../../modules/pip_modules"
  pip_details = var.pip_map
  depends_on  = [module.resource_group]
}

module "bastion" {
  source          = "../../modules/Bastion_module"
  bastion_details = var.bastion_map
  depends_on      = [module.subnet, module.public_ip]
}