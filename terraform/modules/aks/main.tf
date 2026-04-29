resource "azurerm_kubernetes_cluster" "this" {
    name = var.name
    location = var.location
    resource_group_name = var.resource_group_name
    dns_prefix = var.dns_prefix

    identity {
        type = "SystemAssigned"
    }

    default_node_pool {
      name = "default"
      node_count = var.node_count
      vm_size = "standard_d2ls_v5"
    }

    network_profile {
        network_plugin = "azure"
        load_balancer_sku = "standard"
    }
}

resource "azurerm_role_assignment" "acr_pull_role" {
    scope = var.acr_id
    role_definition_name = "AcrPull"
    principal_id = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}