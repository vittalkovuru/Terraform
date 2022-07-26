data "azurerm_client_config" "current" {}

module "resource_group" {    
  source    = "../modules/resourcegroup"
  rg_name   = var.rg_name
  location  = var.location  
  tags      = var.tags
}

module "key_vault" {    
  source    = "../modules/keyvault"
  depends_on = [ module.resource_group ]
  kv_name   = var.kv_name
  rg_name   = var.rg_name
  location  = var.location  
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
}

module "storage_account" {    
  source    = "../modules/storageaccount"
  depends_on = [ module.resource_group ]
  rg_name   = var.rg_name
  st_name   = var.st_name
  location  = var.location  
  tags      = var.tags
}

module "app_service_plan" {    
  depends_on = [ module.resource_group ]
  source    = "../modules/appserviceplan"
  asp_name  = var.asp_name
  location  = var.location  
  rg_name   = var.rg_name
}

module "function_app" {  
  depends_on                    = [ module.storage_account ]
  source                        = "../modules/functionapp"
  fun_name                      = var.fun_name
  rg_name                       = var.rg_name
  st_name                       = var.st_name
  location                      = var.location
  app_service_plan_id           = module.app_service_plan.app_service_id
  storage_account_access_key    = module.storage_account.primary_access_key
}

module "cosmosdb_account" {    
  source    = "../modules/cosmosdb"
  depends_on = [ module.key_vault ]
  rg_name   = var.rg_name
  location  = var.location  
}

module "aks" {    
  source    = "../modules/aks"
  depends_on = [ module.key_vault ]
  rg_name   = var.rg_name
  location  = var.location  
}

module "key_vault_secret" {
  source              = "../modules/keyvaultsecret"
  depends_on          = [module.key_vault, module.aks, module.cosmosdb_account]
  key_vault_id        = module.key_vault.key_vault_id
  secret_names = {
    "aks-kube-config"   = module.aks.kube_config
    "aks-certifcates"   = module.aks.client_certificate
    "cosmos-db-primary-key"   = module.cosmosdb_account.primary_key
    "cosmos-db-secondary-key" = module.cosmosdb_account.secondary_key
  }
}







