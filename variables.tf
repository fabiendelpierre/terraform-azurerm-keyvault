variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to place the Key Vault"
}

variable "location" {
  type        = string
  description = "The Azure region where the Key Vault instance should be created"
}

variable "authorized_entities" {
  type        = map(any)
  description = "A set of Azure AD objects (users/groups) in GUID format allowed to list (but not read) the contents (secrets/keys)."
}

variable "network_acl_default_action" {
  type    = string
  default = "Allow"
  validation {
    condition     = var.network_acl_default_action == "Allow" || var.network_acl_default_action == "Deny"
    error_message = "Accepted values for var.network_acl_default_action are either Allow or Deny."
  }
}

variable "network_acl_bypass" {
  type    = string
  default = "AzureServices"
  validation {
    condition     = var.network_acl_bypass == "AzureServices" || var.network_acl_bypass == "None"
    error_message = "Accepted values for var.network_acl_bypass are either AzureServices or None."
  }
}

variable "authorized_cidrs" {
  type        = list(string)
  default     = []
  description = "A list of external subnets in CIDR notation that are allowed to connect to this instance of Key Vault."
}

variable "authorized_subnet_ids" {
  type        = list(string)
  default     = []
  description = "A list of Azure subnet IDs that are allowed to connect to this instance of Key Vault."
}

variable "tags" {
  type = map(any)
}

variable "base_name" {
  type = string
}