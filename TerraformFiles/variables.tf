variable "rg_name" {
  type        = string
  default     = "devops-hardway-azure-stanley"
  description = "Name for resource group"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Azure Location of resources"
}

variable "acr_name" {
    type = string
    default = "acrstanazure"
    description = "container instance name"
}

variable "aci_name" {
    type = string
    default = "acistanazure"
    description = "container instance name"
}

variable "build_id" {
  type        = string
  description = "Build ID of  Pipeline"
}