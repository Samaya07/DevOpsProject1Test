module "rg" {
    source = "../../modules/resource-group"
    name = "rg-dev"
    location = "South India"
}

module "acr" {
    source = "../../modules/acr"
    name = "crflaskdev"
    resource_group_name = module.rg.name
    location = module.rg.location
}

module "aks" {
    source = "../../modules/aks"
    name = "aks-flaskdev"
    location = module.rg.location
    resource_group_name = module.rg.name
    dns_prefix = "dnsflaskdev"
    acr_id = module.acr.id
    node_count = 2
}

module "managed_identity" {
    source = "../../modules/managed-identity"
    name = "user_managed_identity_dev"
    location = module.rg.location
    resource_group_name = module.rg.name
    subject = "repo:Samaya07/DevOpsProject1Test:ref:refs/heads/dev"
}