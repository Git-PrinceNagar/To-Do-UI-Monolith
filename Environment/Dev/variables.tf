variable "resource_groups" {
  type = map(object({
    rg_name  = string
    location = string
    tags     = map(string)
  }))
}

variable "vns" {
  type = map(object({
    vn_name             = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = list(string)
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "vms" {
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string


    nic_name                        = string
    script_name                     = string
    vm_name                         = string
    size                            = string
    key_vault_name                  = string
    key_vault_resource_group_name   = string
    disable_password_authentication = bool
    subnet_name                     = string
    virtual_network_name            = string

  }))
}

variable "mssql" {
  type = map(object({
    server_name                   = string
    resource_group_name           = string
    location                      = string
    version                       = string
    administrator_login           = string
    administrator_login_password  = string
    database_name                 = string
    key_vault_name                = string
    key_vault_resource_group_name = string
  }))
}

