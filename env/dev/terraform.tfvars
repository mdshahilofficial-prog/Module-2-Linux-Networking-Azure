resource_groups = {
  "rg1" = {
    name     = "rg-dev-westus"
    location = "westus"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
}
virtual_networks = {
  "vnet1" = {
    name                = "vnet-dev-westus"
    location            = "westus"
    resource_group_name = "rg-dev-westus"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
}
subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-dev-westus"
    virtual_network_name = "vnet-dev-westus"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-dev-westus"
    virtual_network_name = "vnet-dev-westus"
    address_prefixes     = ["10.0.3.0/24"]
  }
  subnet3 = {
    name                 = "ApplicationGatewaySubnet"
    resource_group_name  = "rg-dev-westus"
    virtual_network_name = "vnet-dev-westus"
    address_prefixes     = ["10.0.4.0/24"]
  }
}
public_ips = {
  "pip1" = {
    name                = "bastion-pip"
    location            = "westus"
    resource_group_name = "rg-dev-westus"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
  pip2 = {
    name                = "appgw-pip"
    location            = "westus"
    resource_group_name = "rg-dev-westus"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
  pip3 = {
    name                = "natgw-pip"
    location            = "westus"
    resource_group_name = "rg-dev-westus"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
}
bastion_hosts = {
  "bastion1" = {
    name                = "bastion-host"
    location            = "westus"
    resource_group_name = "rg-dev-westus"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
    subnet_name                   = "AzureBastionSubnet"
    subnet_virtual_network_name   = "vnet-dev-westus"
    subnet_resource_group_name    = "rg-dev-westus"
    public_ip_name                = "bastion-pip"
    public_ip_resource_group_name = "rg-dev-westus"
  }
}
nat_gateways = {
  "nat1" = {
    name                = "nat-dev-westus"
    location            = "west us"
    resource_group_name = "rg-dev-westus"
    sku_name            = "StandardV2"
    tags = {
      environment = "dev"
      owner       = "team1"
    }
  }
}
nat_gateway_associations = {
  "natgw_assoc1" = {
    subnet_name                   = "frontend-subnet"
    nat_gateway_key               = "nat1"
    subnet_virtual_network_name   = "vnet-dev-westus"
    subnet_resource_group_name    = "rg-dev-westus"
    public_ip_name                = "natgw-pip"
    public_ip_resource_group_name = "rg-dev-westus"
  }
}
network_interfaces = {
  nic1 = {
    name                        = "frontend-linux-vm-nic1"
    location                    = "west us"
    resource_group_name         = "rg-dev-westus"
    subnet_name                 = "frontend-subnet"
    subnet_virtual_network_name = "vnet-dev-westus"
    subnet_resource_group_name  = "rg-dev-westus"
  }
}
linux_virtual_machines = {
  vm1 = {
    name                                  = "frontend-vm"
    resource_group_name                   = "rg-dev-westus"
    location                              = "west us"
    size                                  = "Standard_D4_v5"
    admin_username                        = "adminuser"
    admin_password                        = "@ms24092003"
    os_disk_caching                       = "ReadWrite"
    os_disk_storage_account_type          = "Standard_LRS"
    image_publisher                       = "Canonical"
    image_offer                           = "0001-com-ubuntu-server-jammy"
    image_sku                             = "22_04-lts"
    image_version                         = "latest"
    network_interface_name                = "frontend-linux-vm-nic1"
    network_interface_resource_group_name = "rg-dev-westus"
  }
}