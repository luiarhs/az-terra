# terraform/environments/dev/main.tf

module "aks_cluster" {
  source = "../../modules/aks"

  resource_group_name = "your-resource-group"
  cluster_name        = "your-cluster-name"
  location            = "your-location"
  node_count          = 3
  node_vm_size        = "Standard_DS2_v2"
}

# terraform/environments/dev/main.tf

module "database" {
  source = "../../modules/database"

  resource_group_name   = "your-resource-group"
  location              = "your-location"
  database_name         = "your-database-name"
  server_name           = "your-server-name"
  administrator_login   = "your-admin-login"
  administrator_password = "your-admin-password"
}
