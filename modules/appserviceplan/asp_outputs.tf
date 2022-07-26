output "app_service_id" {
  description = "Name of the App Service Plan component."
  value = azurerm_app_service_plan.asp.id
}
