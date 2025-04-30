resource "azurerm_application_security_group" "asg" {
    name                = var.name
    location            = var.location
    resource_group_name = var.resource_group_name
    #enable_telemetry    = var.enable_telemetry
    tags                = var.tags
    
    # lifecycle {
    #     prevent_destroy = true
    # }
}