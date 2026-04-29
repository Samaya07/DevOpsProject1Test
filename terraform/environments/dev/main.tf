module "rg" {
    source = "../../modules/resource-group"
    name = "rgdev1"
    location = "South India"
}

module "acr" {
    source = "../../modules/acr"
    name = "crflaskdev1"
    resource_group_name = module.rg.name
    location = module.rg.location
}

module "aks" {
    source = "../../modules/aks"
    name = "aks-flaskdev1"
    location = module.rg.location
    resource_group_name = module.rg.name
    dns_prefix = "dnsflaskdev"
    acr_id = module.acr.id
    node_count = 2
}