resource "azurerm_function_app" "example" {
  name                       = var.fun_name
  location                   = var.location
  resource_group_name        = var.rg_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.st_name
  storage_account_access_key = var.storage_account_access_key
}