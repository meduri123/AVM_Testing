output "name" {
  value = module.vnet.name
}
output "vnet_id" {
  value = module.vnet.resource_id
}
output "route_table_id" {
  value = module.route_table.resource_id
}
output "app_subnet_id" {
  value = module.vnet.subnets["Application"].resource_id
}
output "db_subnet_id" {
  value = module.vnet.subnets["database"].resource_id
}

# output "subnet2_id" {
#   value = module.subnet2.resource_id
# }
# output "nsg_id" {
#   value = module.network_security_group.resource_id
# }

# output "nsg_name" {
#   value = module.network_security_group.name
# }
