 variable "subnet_id" {
    description = "The ID of the subnet to associate with the network security group."
    type        = string
 }
 variable "network_security_group_id" {
    description = "The ID of the network security group to associate with the subnet."
    type        = string    
 }
 variable "route_table_id" {
    description = "The ID of the route table to associate with the subnet."
    type        = string  
 }