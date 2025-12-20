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
