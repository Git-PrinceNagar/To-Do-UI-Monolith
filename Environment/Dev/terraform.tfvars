resource_groups = {
  rg1 = {
    rg_name  = "rg-dev-core-001"
    location = "central india"
    tags = {
      environment = "Dev"
    }
  }
}

vns = {
  vn1 = {
    vn_name             = "dev_virtual_network"
    location            = "central india"
    resource_group_name = "rg-dev-core-001"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    subnets = {
      subnet1 = {
        name             = "fronteend_subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "backend_subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

vms = {
  "frontend_vm" = {
    pip_name            = "frontend_pip"
    resource_group_name = "rg-dev-core-001"
    location            = "central india"
    allocation_method   = "Static"


    nic_name                        = "fronteend_nic"
    script_name                     = "nginx.sh"
    vm_name                         = "frontend-linux-machine"
    size                            = "Standard_F2"
    key_vault_name                  = "vms-cred"
    key_vault_resource_group_name   = "key-vault-rg"
    disable_password_authentication = "false"
    subnet_name                     = "fronteend_subnet"
    virtual_network_name            = "dev_virtual_network"

  }

  "backend_vm" = {
    pip_name            = "backend_pip"
    resource_group_name = "rg-dev-core-001"
    location            = "central india"
    allocation_method   = "Static"


    nic_name                        = "backend_nic"
    script_name                     = "nginx.sh"
    vm_name                         = "backend-linux-machine"
    size                            = "Standard_F2"
    key_vault_name                  = "vms-cred"
    key_vault_resource_group_name   = "key-vault-rg"
    disable_password_authentication = "false"
    subnet_name                     = "backend_subnet"
    virtual_network_name            = "dev_virtual_network"

  }
}

mssql = {
  sql1 = {
    server_name                   = "mysql-server-database"
    resource_group_name           = "rg-dev-core-001"
    location                      = "central india"
    version                       = "12.0"
    administrator_login           = "prince612"
    administrator_login_password  = "Prince$612"
    database_name                 = "mydatabase"
    key_vault_name                = "vms-cred"
    key_vault_resource_group_name = "key-vault-rg"
  }
}
