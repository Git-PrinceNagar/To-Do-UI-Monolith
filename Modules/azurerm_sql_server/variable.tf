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
