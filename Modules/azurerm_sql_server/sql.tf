resource "azurerm_mssql_server" "sql_server" {
    for_each = var.mssql
  name                         = each.value.server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.sql_username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.sql_password[each.key].value
}

resource "azurerm_mssql_database" "sq_database" {
    for_each = var.mssql
  name         = each.value.database_name
  server_id    = azurerm_mssql_server.sql_server[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
}