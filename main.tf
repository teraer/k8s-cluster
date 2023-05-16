data "azurerm_resource_group" "main" {
    name = "${var.prefix}-resources"
}

module "aks" {
    source  = "tfe.<student-id>.<lab-id>.workshops.arctiq.ca/<TFE-ORG>/aks/azure"
    version = "1.0.1"

    # insert required variables here
    cluster_name          = var.cluster_name
    resource_group_name   = data.azurerm_resource_group.main.name
    ARM_CLIENT_ID         = var.ARM_CLIENT_ID
    ARM_CLIENT_SECRET     = var.ARM_CLIENT_SECRET
    prefix                = var.prefix
}