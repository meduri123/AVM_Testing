data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "vnet" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.8.1"

  name                = var.vnet_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = toset(var.vnet_address_space)
  tags                = var.tags
  enable_telemetry    = false

  subnets = { for k, subnet_info in var.vnet_subnets : "${k}" => {
    name                  = subnet_info.name
    address_prefix      = subnet_info.address_prefix
    
    network_security_group_id = {
      id = module.network_security_group[subnet_info.network_security_group].resource_id 
      }

    route_table_id = {
      id = module.route_table.resource_id 
      }
  } }
}

module "network_security_group" {
  source              = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version             = "0.4.0"
  for_each = var.nsg_names
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  name                = each.value
  tags                = var.tags
  security_rules      = var.security_rules
  enable_telemetry    = false
}


# resource "azurerm_subnet_network_security_group_association" "nsg_association" {
#   subnet_id = module.vnet.subnets["Application"].resource_id
#   network_security_group_id = module.network_security_group.resource_id

#   depends_on = [ module.vnet, module.network_security_group]
# }

# resource "azurerm_subnet_network_security_group_association" "nsg_association_db" {
#   subnet_id = module.vnet.subnets["database"].resource_id
#   network_security_group_id = module.network_security_group.resource_id
#   depends_on = [ module.vnet, module.network_security_group]
# }


module "asg" {
  source              = "./modules/application_security_group"
  for_each            = var.asg_names
  name                = each.key
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
}

module "route_table" {
  source = "azure/avm-res-network-routetable/azurerm"
  version = "0.4.1"

  name            = "my-route-table"
  resource_group_name = data.azurerm_resource_group.rg.name
  location        = data.azurerm_resource_group.rg.location
  tags            = var.tags
  enable_telemetry = false
}

# module "public_ip" {
#   source  = "Azure/avm-res-network-publicipaddress/azurerm"
#   version = "0.2.0" # Replace with the latest version

#   # Required Variables
#   resource_group_name = data.azurerm_resource_group.rg.name
#   location            = data.azurerm_resource_group.rg.location
#   name                = var.public_ip_name

#   # Optional Variables
#   sku                     = var.sku
#   allocation_method        = var.allocation_method
#   idle_timeout_in_minutes  = var.idle_timeout_in_minutes
#   # domain_name_label        = var.domain_name_label
#   # reverse_fqdn             = var.reverse_fqdn
#   zones                    = var.zones
#   tags                     = var.tags
#   # public_ip_prefix_id      = var.public_ip_prefix_id
#   # ddos_protection_mode     = var.ddos_protection_mode
#   # ddos_protection_plan_id  = var.ddos_protection_plan_id
#   ip_version               = var.ip_version

# }

# module "user_assigned_identity" {
#   source  = "Azure/avm-res-managedidentity-userassignedidentity/azurerm"
#   version = "0.2.0" # Use the latest verified version

#   name                = "my-user-assigned-identity"
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name

#   tags = {
#     Environment = "Production"
#   }
# }



# module "keyvault" {
#   source  = "Azure/avm-res-keyvault-vault/azurerm"
#   version = "0.3.0" # Use the latest verified version

#   name                = "mykeyvaultsrikan133"
#   resource_group_name = data.azurerm_resource_group.rg.name
#   location            = data.azurerm_resource_group.rg.location
#   tenant_id           = data.azurerm_client_config.current.tenant_id
#   sku_name            = "standard"

#   secrets = {
#     "pfx-certificate" = {
#       name = "pfx-certificate"
#       value = filebase64("./cert/filessl.pfx")
#     }
#     "pfx-password" = {
#       name = "pfx-password"
#       value = "Test"
#     }
#   }


#   network_acls = {
#     default_action = "Deny"
#     bypass         = "AzureServices"
#   }

#   #enable_rbac_authorization = true # Set to true if you are using RBAC authorization.
#   #remove access_policies

#   #soft_delete_retention_days = 90
#   purge_protection_enabled  = true

#   tags = {
#     Environment = "Production"
#   }
# }

# module "subnet1" {
#   source  = "Azure/avm-res-network-virtualnetwork/azurerm//modules/subnet"
#   version = "0.8.1"

#   virtual_network        = { resource_id = module.vnet.resource_id }
#   name                  = var.subnet1.name
#   address_prefixes      = var.subnet1.address_prefixes
#   service_endpoints     = lookup(var.subnet1, "service_endpoints", [])
#   delegation            = lookup(var.subnet1, "delegation", [])
#   private_link_service_network_policies_enabled = lookup(var.subnet1, "private_link_service_network_policies_enabled", null)
# }

# module "subnet2" {
#   source  = "Azure/avm-res-network-virtualnetwork/azurerm//modules/subnet"
#   version = "0.8.1"

#   virtual_network  = { resource_id = module.vnet.resource_id }
#   name                  = var.subnet2.name
#   address_prefixes      = var.subnet2.address_prefixes
#   service_endpoints     = lookup(var.subnet2, "service_endpoints", [])
#   delegation            = lookup(var.subnet2, "delegation", [])
#   private_link_service_network_policies_enabled = lookup(var.subnet2, "private_link_service_network_policies_enabled", null)
# }


#NS Association
# module "nsg_association" {
#   source = "./modules/subnet_association"
#   count = length(module.vnet.subnets)
#   subnet_id                 = values(module.vnet.subnets)[count.index].resource_id
#   #network_security_group_id = module.network_security_group.resource.id
#   #network_security_group_id = values(module.nsgs)[count.index].nsg_id
#   network_security_group_id = length(module.network_security_group) > 0 ? module.network_security_group.network_security_group_id : null
#   route_table_id = length(module.route_table.id_map) > 0 ? values(module.route_table.id_map)[count.index % length(module.route_table.id_map)] : null
# }



# # Network Security Group Association
# resource "azurerm_subnet_network_security_group_association" "nsg_association" {
#   subnet_id = module.vnet.subnets["database"].azapi_resource.subnet
#   network_security_group_id = module.network_security_group.resource.id
# }

# Route Table Association
resource "azurerm_subnet_route_table_association" "route_table_association" {
  for_each = module.vnet.subnets

  subnet_id      = each.value.resource_id
  route_table_id = module.route_table.resource.id
}



# Virtual Machine Module
module "virtual_machine" {
  source  = "Azure/avm-res-compute-virtualmachine/azurerm"
  version = "0.19.1"

  name                         = var.vm_name
  location                     = data.azurerm_resource_group.rg.location
  resource_group_name          = data.azurerm_resource_group.rg.name
  admin_username               = var.admin_username
  admin_password               = var.admin_password
  zone                         = var.availability_zone
  os_type                      = "Linux"
  source_image_reference       = var.source_image_reference
  disable_password_authentication = var.disable_password_auth
  encryption_at_host_enabled = false
  network_interfaces = {
  testnic = {
    name                 = "test-nic"

    ip_configurations = {
    ipconfig1 = {
      name                          = "testipconfig1"
      private_ip_subnet_resource_id  = module.vnet.subnets["Application"].resource_id
      private_ip_address_allocation = "Dynamic"
      #public_ip_address_id          = module.public_ip.resource_id
    }
  }
  }
}
  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  sku_size = var.vm_size
  tags = var.tags
}
# # # Network Interface
# module "network_interface" {
#   source  = "Azure/avm-res-network-networkinterface/azurerm"
#   version = "0.1.0"

#   name                = "${var.vm_name}-nic"
#   resource_group_name = data.azurerm_resource_group.rg.name
#   location           = data.azurerm_resource_group.rg.location
#   tags               = var.tags

#   ip_configurations = {
#     ipconfig1 = {
#       name                          = "ipconfig1"
#       subnet_id                     = module.vnet.subnets["Application"].resource_id
#       private_ip_address_allocation = "Dynamic"
#       public_ip_address_id          = module.public_ip.resource_id
#       primary                       = true
#     }
#   }
# }

# Public IP
module "public_ip" {
  source  = "Azure/avm-res-network-publicipaddress/azurerm"
  version = "0.2.0"

  name                = "${var.vm_name}-pip"
  resource_group_name = data.azurerm_resource_group.rg.name
  location           = data.azurerm_resource_group.rg.location
  sku                = "Standard"
  allocation_method  = "Static"
  tags               = var.tags
}
