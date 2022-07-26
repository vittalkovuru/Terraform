resource "azurerm_app_service_plan" "asp" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.rg_name
   sku {
    tier = "Standard"
    size = "S1"
  }
}
