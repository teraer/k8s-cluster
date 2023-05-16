data "azurerm_resource_group" "main" {
    name = "${var.prefix}-resources"
}

module "aks" {
    source  = "tfe.exu.3381802800.workshops.arctiq.ca/arctiq/aks/azure"
    version = "1.0.2"

    # insert required variables here
    cluster_name          = var.cluster_name
    resource_group_name   = data.azurerm_resource_group.main.name
    ARM_CLIENT_ID         = var.ARM_CLIENT_ID
    ARM_CLIENT_SECRET     = var.ARM_CLIENT_SECRET
    prefix                = var.prefix
}

output "kubernetes_cluster_name" {
   value = module.aks.kubernetes_cluster_name
}