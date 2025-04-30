variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the resources."
  default     = {}
}

variable "vnet_name" {
  type        = string
  description = "The name for the virtual network."
}
variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the virtual network."
}
variable "vnet_subnets" {
  type = map(object({
    name           = string
    address_prefix = string
    network_security_group = string
  }))
}

# variable "subnet1" {
#   description = "Configuration for subnet 1."
#   type = object({
#     name                                     = string
#     address_prefixes                         = list(string)
#     service_endpoints                        = optional(list(string), [])
#     delegation                               = optional(list(object({
#       name = string
#       service_delegation = object({
#         name = string
#         actions = list(string)
#       })
#     })), [])
#     private_link_service_network_policies_enabled = optional(bool, null)
#   })
# }


# variable "subnet2" {
#   description = "Configuration for subnet 2."
#   type = object({
#     name                                     = string
#     address_prefixes                         = list(string)
#     service_endpoints                        = optional(list(string), [])
#     delegation                               = optional(list(object({
#       name = string
#       service_delegation = object({
#         name = string
#         actions = list(string)
#       })
#     })), [])
#     private_link_service_network_policies_enabled = optional(bool, null)
#   })
# }


variable "nsg_names" {
}
variable "security_rules" {
  type = map(object({
    access                                     = string
    description                                = optional(string)
    destination_address_prefix                 = optional(string)
    destination_address_prefixes               = optional(set(string))
    destination_application_security_group_ids = optional(set(string))
    destination_port_range                     = optional(string)
    destination_port_ranges                    = optional(set(string))
    direction                                  = string
    name                                       = string
    priority                                   = number
    protocol                                   = string
    source_address_prefix                      = optional(string)
    source_address_prefixes                    = optional(set(string))
    source_application_security_group_ids      = optional(set(string))
    source_port_range                          = optional(string)
    source_port_ranges                         = optional(set(string))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
}

variable "asg_names" {
  description = "A map of application security group names."
  type        = map(string)
  default     = {}
}

# variable "public_ip_name" {
#   description = "The name of the Public IP."
#   type        = string
# }

# variable "sku" {
#   description = "The SKU of the Public IP. Accepted values are 'Basic' and 'Standard'."
#   type        = string
#   default     = "Basic"
# }

# variable "allocation_method" {
#   description = "The allocation method for the Public IP. Accepted values are 'Static' and 'Dynamic'."
#   type        = string
#   default     = "Dynamic"
# }

# variable "idle_timeout_in_minutes" {
#   description = "Specifies the timeout for the TCP idle connection in minutes."
#   type        = number
#   default     = 4
# }

# variable "domain_name_label" {
#   description = "The label for the Domain Name. Will be used to make up the FQDN."
#   type        = string
#   default     = null
# }

# variable "reverse_fqdn" {
#   description = "A fully qualified domain name that resolves to this public IP address."
#   type        = string
#   default     = null
# }

# variable "zones" {
#   description = "A list of availability zones to spread the Public IP across."
#   type        = list(string)
#   default     = []
# }
# # variable "public_ip_prefix_id" {
# #   description = "The ID of the Public IP Prefix from which to allocate the Public IP."
# #   type        = string
# #   default     = null
# # }

# # variable "ddos_protection_mode" {
# #   description = "The DDoS protection mode of the Public IP. Accepted values are 'Disabled' and 'Enabled'."
# #   type        = string
# #   default     = "Disabled"
# # }

# # variable "ddos_protection_plan_id" {
# #   description = "The ID of the DDoS protection plan associated with the Public IP."
# #   type        = string
# #   default     = null
# # }

# variable "ip_version" {
#   description = "The IP version to use. Accepted values are 'IPv4' and 'IPv6'."
#   type        = string
#   default     = "IPv4"
# }


# #Application gateway

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_D2ds_v5"
}
variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
}
variable "source_image_reference" {
  description = "Source image reference for the VM"
  type        = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}
variable "disable_password_auth" {
  description = "Disable password authentication for the VM"
  type        = bool
  default     = false
}


variable "availability_zone" {
  description = "Availability zone for the VM"
  type        = string
  default     = null
}