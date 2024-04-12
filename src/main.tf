
module "aks_cluster" {
  source  = "./modules/aks"
  // Configuration for AKS module
  resource_group_name = var.resource_group_name
  cluster_name        = "aksenvironment01"
  location            = "southcentralus"
  node_count          = 3
  node_vm_size        = "Standard_DS2_v2"
}

module "database" {
  source  = "./modules/database"
  // Configuration for Azure SQL Database module
  resource_group_name   = var.resource_group_name
  location              = "southcentralus"
  database_name         = "db01"
  server_name           = "ballast-sqlserver"
  administrator_login   = "ballastlane01"
  administrator_password = ""
}
