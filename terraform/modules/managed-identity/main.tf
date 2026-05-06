
data "azurerm_subscription" "current" {
}

output "current_subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}

resource "azurerm_user_assigned_identity" "this" {
    name = var.name
    location = var.location
    resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "contributor_role" {
    principal_id = azurerm_user_assigned_identity.this.principal_id
    scope = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"
    role_definition_name = "Contributor"
}

resource "azurerm_federated_identity_credential" "fc_github" {
    name = "fc_github"
    user_assigned_identity_id = azurerm_user_assigned_identity.this.id
    audience = ["api://AzureADTokenExchange"]
    issuer = "https://token.actions.githubusercontent.com"
    subject = var.subject

}
