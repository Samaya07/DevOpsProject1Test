module "rg" {
    source = "../../modules/resource-group"
    name = "rgprod1"
    location = "South India"
}

module "acr" {
    source = "../../modules/acr"
    name = "crflaskprod1"
    resource_group_name = module.rg.name
    location = module.rg.location
}

module "aks" {
    source = "../../modules/aks"
    name = "aks-flaskprod1"
    location = module.rg.location
    resource_group_name = module.rg.name
    dns_prefix = "dnsflaskprod"
    acr_id = module.acr.id
    node_count = 3
}