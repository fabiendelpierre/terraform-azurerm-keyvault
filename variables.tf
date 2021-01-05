variable "resource_group_name" {
  type = string
  description = "The name of the resource group in which to place the Key Vault"
}

variable "location" {
  type = string
  description = "The Azure region where the Key Vault instance should be created"
}

variable "authorized_entities" {
  type = map
  description = "A set of Azure AD objects (users/groups) in GUID format allowed to list (but not read) the contents (secrets/keys)."
}

variable "authorized_cidrs" {
  type = list(string)
  default = []
  description = "A list of external subnets in CIDR notation that are allowed to connect to this instance of Key Vault."
}

variable "authorized_subnet_ids" {
  type = list(string)
  default = []
  description = "A list of Azure subnet IDs that are allowed to connect to this instance of Key Vault."
}

variable "tags" {
  type = map
}

variable "base_name" {
  type = string
}