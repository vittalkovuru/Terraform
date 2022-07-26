output "primary_access_key" {
    description = "primary_access_key."
    value = azurerm_storage_account.storage.primary_access_key
    sensitive = true  
}