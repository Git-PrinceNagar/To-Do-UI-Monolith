data "azurerm_key_vault" "kv" {
  for_each            = var.mssql
  name                = each.value.key_vault_name
  resource_group_name = each.value.key_vault_resource_group_name
}

data "azurerm_key_vault_secret" "sql_username" {
  for_each     = var.mssql
  name         = "sql-username"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "sql_password" {
  for_each     = var.mssql
  name         = "sql-password"
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
