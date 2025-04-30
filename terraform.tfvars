subscription_id     = "c5dd9b7d-a3b4-4e19-8889-fbbc538569e7"
tenant_id           = "be0688bf-d17d-4fe9-a146-37b977388ad7"
resource_group_name = "McCain-GLR-Srikanth"
location            = "Central India"
tags = {
  billingReference = "12345"
  opEnvironment    = "dev"
  cmdReference     = "McCain-GLR"
}

vnet_name          = "test-vnet"
vnet_address_space = ["10.0.0.0/16"] # Single string, not a list
vnet_subnets = {
  "Application" = {
    name           = "test-app"
    address_prefix = "10.0.1.0/24"
    network_security_group = "app"
  }
  "database" = {
    name           = "test-db"
    address_prefix = "10.0.2.0/24"
    network_security_group = "db"
  }
}
#vnet_dns_servers    = ["168.63.129.16"]

# subnet1 = {
#   name             = "subnet-1"
#   address_prefixes = ["10.0.1.0/24"]
#   service_endpoints = ["Microsoft.Storage"]
#   delegation = [
#     {
#       name = "Microsoft.Web/serverFarms"
#       service_delegation = {
#         name = "Microsoft.Web/serverFarms"
#         actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
#       }
#     }
#   ]
#   network_security_group_id = "/subscriptions/your-subscription-id/resourceGroups/my-rg/providers/Microsoft.Network/networkSecurityGroups/my-nsg"
#   route_table_id = "/subscriptions/your-subscription-id/resourceGroups/my-rg/providers/Microsoft.Network/routeTables/my-rt"
#   private_endpoint_network_policies_enabled = true
#   private_link_service_network_policies_enabled = true
# }


# subnet2 = {
#   name             = "subnet-2"
#   address_prefixes = ["10.0.2.0/24"]
# }

nsg_names = {
  "app" = "testapp-nsg"
  "db"  = "testdb-nsg"
}
security_rules = {
  AllowHTTP = {
    name                       = "Allow-HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  },
  AllowASGTraffic = {
    name                        = "Allow-ASG-Traffic"
    priority                    = 210
    access                      = "Allow"
    direction                   = "Inbound"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "443"
    source_address_prefix      = "Internet"
    #destination_address_prefix  = "/subscriptions/c5dd9b7d-a3b4-4e19-8889-fbbc538569e7/resourceGroups/McCain-GLR-Srikanth/providers/Microsoft.Network/applicationSecurityGroups/testapp"
    destination_application_security_group_ids  = [
      "/subscriptions/c5dd9b7d-a3b4-4e19-8889-fbbc538569e7/resourceGroups/McCain-GLR-Srikanth/providers/Microsoft.Network/applicationSecurityGroups/testapp"
    ]
  }
}


# public_ip_name      = "my-public-ip"
# sku                     = "Standard"
# allocation_method        = "Static"
# idle_timeout_in_minutes  = 10
# domain_name_label        = "mydomain"
# reverse_fqdn             = "myreverse.fqdn.com"
# zones                    = ["1", "2", "3"]

# #public_ip_prefix_id      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-resource-group/providers/Microsoft.Network/publicIPPrefixes/my-public-ip-prefix"
# #ddos_protection_mode     = "Enabled"
# #ddos_protection_plan_id  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-resource-group/providers/Microsoft.Network/ddosProtectionPlans/my-ddos-plan"
# ip_version               = "IPv4"

# #Application gateway


asg_names = {
  "testapp" = "testapp-asg"
  "testdb"  = "testdb-asg"
}
vm_name              = "myLinuxVM"
vm_size              = "Standard_B1s"
admin_username       = "azureuser"
admin_password       = "P@ssw0rd1234!"
source_image_reference = {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-focal"
  sku       = "20_04-lts"
  version   = "latest"
}
availability_zone    = "1"