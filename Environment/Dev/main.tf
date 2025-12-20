module "resource_groups" {
  source          = "../../Modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "virtual_networks" {
  source     = "../../Modules/azurerm_virtual_network"
  depends_on = [var.resource_groups]
  vns        = var.vns
}

module "virtual_machines" {
  source     = "../../Modules/azurerm_virtual_machine"
  vms        = var.vms
  depends_on = [module.virtual_networks]
}

module "mssql_servers" {
  source     = "../../Modules/azurerm_sql_server"
  mssql      = var.mssql
  depends_on = [module.virtual_machines]
}




