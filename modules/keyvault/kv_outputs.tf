output "key_vault_id" {
  description = "The id of the key vault"
  value = azurerm_key_vault.key_vault.id
}

output "key_vault_name" {
  description = "The name of the key vault"
  value = azurerm_key_vault.key_vault.name
}
