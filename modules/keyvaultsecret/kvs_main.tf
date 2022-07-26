resource "azurerm_key_vault_secret" "key_vault_secret" {
  for_each                    = var.secret_names
  name                        = each.key
  value                       = each.value
  key_vault_id                = var.key_vault_id
}

resource "random_password" "random_password" {
  length  = 20
  special = true
}
