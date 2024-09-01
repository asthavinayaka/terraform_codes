rg_map = {
  rg1 = {
    name     = "queensland-dev"
    location = "CanadaCentral"
  }
}

vnet_map = {
  vnet1 = {
    name     = "dev-vnet89"
    rg_name  = "queensland-dev"
    location = "CanadaCentral"
    range    = ["192.168.0.0/16"]
  }
}

subnet_map = {
  sub1 = {
    name      = "frontend-subnet"
    rg_name   = "queensland-dev"
    vnet_name = "dev-vnet89"
    prefixes  = ["192.168.5.0/24"]
  }
  sub2 = {
    name      = "backend-subnet"
    rg_name   = "queensland-dev"
    vnet_name = "dev-vnet89"
    prefixes  = ["192.168.10.0/24"]
  }
  sub3 = {
    name      = "AzureBastionSubnet"
    rg_name   = "queensland-dev"
    vnet_name = "dev-vnet89"
    prefixes  = ["192.168.100.0/24"]
  }
}


key_map = {
  kv1 = {
    name     = "queensland-dev-kv"
    rg_name  = "queensland-dev"
    location = "CanadaCentral"
  }
}

secret_map = {
  sec1 = {
    name  = "username"
    value = "demouser"
  }
  sec2 = {
    name  = "password"
    value = "P@ssw0rd1234"
  }
}

vm_map = {
  vm1 = {
    subnet_name = "frontend-subnet"
    vnet_name   = "dev-vnet89"
    nic_name    = "frontend-nic1"
    rg_name     = "queensland-dev"
    location    = "CanadaCentral"
    vm_name     = "poc-mac-01"
    size        = "Standard_B1s"
  }
  vm2 = {
    subnet_name = "frontend-subnet"
    vnet_name   = "dev-vnet89"
    nic_name    = "frontend-nic2"
    rg_name     = "queensland-dev"
    location    = "CanadaCentral"
    vm_name     = "poc-mac-02"
    size        = "Standard_B1s"
  }
  vm3 = {
    subnet_name = "backend-subnet"
    vnet_name   = "dev-vnet89"
    nic_name    = "backend-nic"
    rg_name     = "queensland-dev"
    location    = "CanadaCentral"
    vm_name     = "poc-mac-11"
    size        = "Standard_B1s"
  }

}

pip_map = {
  pip1 = {
    name     = "bas-pip"
    rg_name  = "queensland-dev"
    location = "CanadaCentral"
    sku      = "Standard"
  }
}

bastion_map = {
  bs1 = {
    name     = "jump-box-01"
    rg_name  = "queensland-dev"
    location = "CanadaCentral"
  }
}