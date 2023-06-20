variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "Azure region where resources should be provisioned"
  type        = string
  default     = "eastus"
}

variable "azure_resource_group" {
  description = "Name of the Azure resource group where resources will be provisioned"
  type        = string
  default     = "pub-acr"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "pubacr123"
}

variable "acr_sku" {
  description = "SKU of the Azure Container Registry"
  default     = "Premium"
}

variable "acr_agent_pool_name" {
  description = "name of the agent pool for ACR"
  type        = string
  default     = "acr-agent-pool"
}

variable "acr_task" {
  description = "name of the task for ACR"
  type        = string
  default     = "acr-task"
}

variable "context_access_token" {
  description = "token for github access (github PAT)"
  type = string
}

variable "context_path" {
  description = "path for dockerfile (github repo url)"
  type = string
  default = "https://github.com/shivamgupta-sg/helloworld-dockerfile.git"
}