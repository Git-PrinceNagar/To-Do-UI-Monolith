data "azurerm_subnet" "data_subnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_key_vault" "kv" {
  for_each            = var.vms
  name                = each.value.key_vault_name
  resource_group_name = each.value.key_vault_resource_group_name
}

data "azurerm_key_vault_secret" "vm_username" {
  for_each     = var.vms
  name         = "username"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "vm_password" {
  for_each     = var.vms
  name         = "password"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
