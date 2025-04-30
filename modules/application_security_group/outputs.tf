output "application_security_group_id" {
  description = "The ID of the application security group."
  value       = azurerm_application_security_group.asg
  
}
output "application_security_group_name" {
  description = "The name of the application security group."
  value       = azurerm_application_security_group.asg.name
  
}