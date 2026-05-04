module "rg" {
    source = "../../modules/resource-group"
    name = "rg-prod"
    location = "South India"
}

module "acr" {
    source = "../../modules/acr"
    name = "crflaskprod"
    resource_group_name = module.rg.name
    location = module.rg.location
}

module "aks" {
    source = "../../modules/aks"
    name = "aks-flaskprod"
    location = module.rg.location
    resource_group_name = module.rg.name
    dns_prefix = "dnsflaskprod"
    acr_id = module.acr.id
    node_count = 3
}

module "managed_identity" {
    source = "../../modules/managed-identity"
    name = "user_managed_identity_prod"
    location = module.rg.location
    resource_group_name = module.rg.name
    subject = "repo:Samaya07/DevOpsProject1Test:ref:refs/heads/main"
}