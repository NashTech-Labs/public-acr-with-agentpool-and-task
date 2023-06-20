# Create azure resource group
resource "azurerm_resource_group" "acr_resource_group" {
  name     = var.azure_resource_group
  location = var.location
  tags     = var.tags
}

# Create azure container registry
resource "azurerm_container_registry" "acr" {
  name                          = var.acr_name
  location                      = var.location
  resource_group_name           = azurerm_resource_group.acr_resource_group.name
  admin_enabled                 = true
  sku                           = var.acr_sku
  public_network_access_enabled = true
  tags                          = var.tags
}

resource "azurerm_container_registry_agent_pool" "acr_agent_pool" {
  name                    = var.acr_agent_pool_name #"example"
  resource_group_name     = var.azure_resource_group
  location                = "eastus"
  container_registry_name = azurerm_container_registry.acr.name
}

resource "azurerm_container_registry_task" "acr_task" {
  name                  = var.acr_task
  container_registry_id = azurerm_container_registry.acr.id
  agent_pool_name       = azurerm_container_registry_agent_pool.acr_agent_pool.name
  platform {
    os = "Linux"
  }
  docker_step {
    dockerfile_path      = "Dockerfile"
    context_path         = var.context_path
    context_access_token = var.context_access_token
    image_names          = ["hellooverload:{{.Run.ID}}"]
  }
  source_trigger {
    name = "commits-trigger"
    events = [ "commit" ]
    repository_url = var.context_path
    source_type = "Github"
    authentication {
      token = var.context_access_token
      token_type = "PAT"
    }
  }
}